#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o subset_bgc-stdout-%j.txt
#SBATCH -e subset_bgc-stderr-%j.txt
#SBATCH -J subset_bgc

cd ~/admixture_mapping/variants/

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
	--keep ~/admixture_mapping/scripts/poplists/CB.indivs --recode --out CB

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
	--keep ~/admixture_mapping/scripts/poplists/AC.indivs --recode --out AC

