#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pca-stdout-%j.txt
#SBATCH -e pca-stderr-%j.txt
#SBATCH -J pca

# mod 2017-01-11

cd ~/admixture_mapping/results/

#pca

#~/bin/plink --file N_S.remove.subsamp \
#--pca header --allow-extra-chr --out ~/admixture_mapping/results/pca.N_S.remove.subsamp


cd ~/breeding/results/pca/
#pca

~/bin/flashpca/flashpca --bfile ~/admixture_mapping/variants/all.thinned --suffix .all.txt

~/bin/flashpca/flashpca --bfile ~/admixture_mapping/variants/noadmix --suffix .noadmix.txt

~/bin/flashpca/flashpca --bfile ~/admixture_mapping/variants/N_S.remove.subsamp --suffix .N_S.remove.subsamp.txt

