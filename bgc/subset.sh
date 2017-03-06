#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o subset_bgc-stdout-%j.txt
#SBATCH -e subset_bgc-stderr-%j.txt
#SBATCH -J subset_bgc

cd ~/admixture_mapping/variants/

## Filter by LD
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
	~/bin/vcftools/bin/vcftools --vcf - \
        --plink --out all.chrom

sed -i 's/^/x/' all.chrom.map

~/bin/plink --file ~/admixture_mapping/variants/all.chrom --indep 50 5 2 \
	--allow-extra-chr -out all.chrom.plink.ld

#Filter pops by ld

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
        ~/bin/vcftools/bin/vcftools --vcf - \
	--keep ~/admixture_mapping/scripts/poplists/CB.indivs \
	--plink --out CB

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
        ~/bin/vcftools/bin/vcftools --vcf - \
        --keep ~/admixture_mapping/scripts/poplists/AC.indivs \
        --plink --out AC


~/bin/plink --file ~/admixture_mapping/variants/CB \
	--extract all.chrom.plink.ld.prune.in \
	--recode --allow-extra-chr \
	--out CB.thin

~/bin/plink --file ~/admixture_mapping/variants/AC \
        --extract all.chrom.plink.ld.prune.in \
        --recode --allow-extra-chr \
        --out AC.thin

#change family variable to pop for downstream pop def in genepop

awk -F " " '{gsub(/-[0-9]+\-[0-9]+/,"", $1);print}' CB.thin.ped > CB.thin.ped.1
mv CB.thin.ped.1 CB.thin.ped

awk -F " " '{gsub(/-[0-9]+\-[0-9]+/,"", $1);print}' AC.thin.ped > AC.thin.ped.1
mv AC.thin.ped.1 AC.thin.ped

