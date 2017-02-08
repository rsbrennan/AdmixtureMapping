#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o admixture-stdout-%j.txt
#SBATCH -e admixture-stderr-%j.txt
#SBATCH -J admixture

# mod 2017-01-11

cd ~/admixture_mapping/results/

sed -i 's/x//g' ~/admixture_mapping/variants/chrom.subsamp.bim

for K in 2 3 4 5 6 7 8;
	do ~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/chrom.subsamp.bed $K | tee log${K}.out; done
