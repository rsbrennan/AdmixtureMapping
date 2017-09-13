#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pca-stdout-%j.txt
#SBATCH -e pca-stderr-%j.txt
#SBATCH -J pca

# mod 2017-05-05
cd ~/admixture_mapping/variants/

for POP in cb ac; do

	sed -i 's/^23/x23/g' ${POP}.thinned.map

	~/bin/plink --file  ~/admixture_mapping/variants/${POP}.thinned \
	--pca header --allow-extra-chr --out ~/admixture_mapping/results/pca.${POP}.thinned

done

#cd ~/admixture_mapping/analysis/pca/

#pca

#for i in cb;
#do

#	~/bin/flashpca/flashpca --bfile ~/admixture_mapping
