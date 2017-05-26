#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o filt.cov-stdout-%j.txt
#SBATCH -e filt.cov-stderr-%j.txt
#SBATCH -J filt.cov

# mod 2017-01-11

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/all.filtered.vcf.gz \
--recode --recode-INFO-all --stdout \
--positions ~/admixture_mapping/results/snp.cov.list \
--max-meanDP 100 |\
bgzip  >  ~/admixture_mapping/variants/all.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/all.vcf.gz
