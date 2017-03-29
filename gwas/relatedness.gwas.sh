#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o relatedness-stdout-%j.txt
#SBATCH -e relatedness-stderr-%j.txt
#SBATCH -J relatedness


cd ~/admixture_mapping/analysis/gwas/

for i in af.bc af bc cb ac N_S.remove; do

	~/bin/gemma -g ~/admixture_mapping/variants/gwas/${i}.bimbam.geno \
	-gk 1 -p ~/admixture_mapping/phenotypes/temp.${i}.pheno.alter -o ${i}

done



