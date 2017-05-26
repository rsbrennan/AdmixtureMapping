#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o allele.count-stdout-%j.txt
#SBATCH -e allele.count-stderr-%j.txt
#SBATCH -J allele.count


#R CMD BATCH ~/admixture_mapping/scripts/gwas/allele.count.R

R CMD BATCH ~/admixture_mapping/scripts/gwas/allele.count.CB.R
