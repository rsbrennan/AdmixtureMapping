#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o filt.cov-stdout-%j.txt
#SBATCH -e filt.cov-stderr-%j.txt
#SBATCH -J filt.cov

# mod 2017-01-11

module load vcftools/0.1.13

#format snps to keep based on depth and coverage
cat ~/admixture_mapping/results/coveredbyN.all.0.8.8.txt | \
sed 's/:/\t/g' > ~/admixture_mapping/results/snp.cov.all.list

#filter vcf and subset to coast and chesapeake
vcftools --gzvcf ~/admixture_mapping/variants/all.filtered.vcf.gz \
--recode --recode-INFO-all --stdout \
--maf 0.01 \
--keep ~/admixture_mapping/scripts/poplists/CB.keep \
--positions ~/admixture_mapping/results/snp.cov.all.list \
--max-meanDP 100 |\
bgzip  >  ~/admixture_mapping/variants/cb.final.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/cb.final.vcf.gz

vcftools --gzvcf ~/admixture_mapping/variants/all.filtered.vcf.gz \
--recode --recode-INFO-all --stdout \
--positions ~/admixture_mapping/results/snp.cov.all.list \
--maf 0.01 \
--max-meanDP 100 |\
bgzip  >  ~/admixture_mapping/variants/all.final.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/all.final.vcf.gz

vcftools --gzvcf ~/admixture_mapping/variants/all.filtered.vcf.gz \
--recode --recode-INFO-all --stdout \
--maf 0.01 \
--remove ~/admixture_mapping/scripts/poplists/CB.keep \
--positions ~/admixture_mapping/results/snp.cov.all.list \
--max-meanDP 100 |\
bgzip  >  ~/admixture_mapping/variants/ac.final.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/ac.final.vcf.gz
