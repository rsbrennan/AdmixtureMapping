#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pca-stdout-%j.txt
#SBATCH -e pca-stderr-%j.txt
#SBATCH -J pca

# mod 2017-01-11

cd ~/admixture_mapping/variants/

#pca

~/bin/plink --file chrom.subsamp \
--pca header --allow-extra-chr --out ~/admixture_mapping/results/pca.subsamp
