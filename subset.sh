#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o subset-stdout-%j.txt
#SBATCH -e subset-stderr-%j.txt
#SBATCH -J subset


cd ~/admixture_mapping/variants/

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
	--keep ~/admixture_mapping/scripts/poplists/AF.BC.indivs --recode --out AF.BC



