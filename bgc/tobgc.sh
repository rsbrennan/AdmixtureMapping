#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobgc-stdout-%j.txt
#SBATCH -e tobgc-stderr-%j.txt
#SBATCH -J tobgc


R CMD BATCH ~/admixture_mapping/scripts/bgc/tobgc.R
