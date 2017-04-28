#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o toplink-stdout-%j.txt
#SBATCH -e toplink-stderr-%j.txt
#SBATCH -J toplink

# mod 2017-01-11

module load vcftools/0.1.13

cd ~/admixture_mapping/variants/



#zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
#sed 's/chr//g' |\
#~/bin/vcftools/bin/vcftools --vcf - \
#--keep ~/admixture_mapping/scripts/poplists/N_S.remove.subsamp.indivs \
#--plink --out N_S.remove.subsamp

#all indivs
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
vcftools --vcf - \
--plink \
--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
--out all.chrom

for i in N_S.remove N_S.remove.subsamp CB AC noadmix;
do

	zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
	vcftools --vcf - \
	--keep ~/admixture_mapping/scripts/poplists/${i}.keep \
	--plink \
	--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
 	--out ${i}

done
