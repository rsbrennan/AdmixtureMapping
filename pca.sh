#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pca-stdout-%j.txt
#SBATCH -e pca-stderr-%j.txt
#SBATCH -J pca

# mod 2017-05-05

#~/bin/plink --file N_S.remove.subsamp \
#--pca header --allow-extra-chr --out ~/admixture_mapping/results/pca.N_S.remove.subsamp


cd ~/admixture_mapping/analysis/pca/
#pca

for i in N_S.remove N_S.remove.subsamp noadmix all.subsamp all;
do

	~/bin/flashpca/flashpca --bfile ~/admixture_mapping/variants/${i}.thinned --suffix .${i}.txt

done

