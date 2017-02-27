#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o format.local-stdout-%j.txt
#SBATCH -e format.local-stderr-%j.txt
#SBATCH -J format.local


R CMD BATCH ~/admixture_mapping/scripts/gwas/format.local.R
