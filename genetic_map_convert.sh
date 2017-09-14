#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o genetic_map-stdout-%j.txt
#SBATCH -e genetic_map-stderr-%j.txt
#SBATCH -J genetic_map


#R CMD BATCH ~/admixture_mapping/scripts/R_scripts/genetic_map_convert.R

#R CMD BATCH ~/admixture_mapping/scripts/R_scripts/genetic_map_convert_all.R

R CMD BATCH ~/admixture_mapping/scripts/R_scripts/genetic_map_convert.ac.R
