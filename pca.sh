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

~/bin/plink --file all.90.chrom \
--extract all.90.chrom.plink.ld.prune.in \
--keep ~/admixture_mapping/variants/subsamp.list \
--pca header --allow-extra-chr --out pca.sub.all
