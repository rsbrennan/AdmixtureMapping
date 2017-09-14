#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o maf-stdout-%j.txt
#SBATCH -e maf-stderr-%j.txt
#SBATCH -J maf

cd ~/admixture_mapping/analysis/

module load vcftools/0.1.13

zcat ~/admixture_mapping/variants/cb.chrom.vcf.gz |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/PP.PL.indivs \
--freq \
--out cb.maf
