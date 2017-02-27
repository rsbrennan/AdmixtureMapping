#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o relatedness-stdout-%j.txt
#SBATCH -e relatedness-stderr-%j.txt
#SBATCH -J relatedness


cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/af.bc.bimbam.thin.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.pheno.alter -o af.bc.thin

cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/af.bimbam.thin.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.AF.pheno -o af.thin

cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/bc.bimbam.thin.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.BC.pheno.alter -o bc.thin

cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/af.bc.bimbam.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.pheno.alter -o af.bc

cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/af.bimbam.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.AF.pheno -o af

cd ~/admixture_mapping/analysis/gwas/
~/bin/gemma -g ~/admixture_mapping/variants/bc.bimbam.geno \
-gk 1 -p ~/admixture_mapping/phenotypes/temp.BC.pheno.alter -o bc
