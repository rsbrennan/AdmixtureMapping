#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gwas_format-stdout-%j.txt
#SBATCH -e gwas_format-stderr-%j.txt
#SBATCH -J gwas_format


R CMD BATCH ~/admixture_mapping/scripts/gwas/gwas_format.R
