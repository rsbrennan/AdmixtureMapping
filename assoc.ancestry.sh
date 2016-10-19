#!/bin/bash -l
#SBATCH -J assoc.ancestry
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH --mem=26GB

R CMD BATCH ~/admixture_mapping/scripts/assoc.ancestry.R
