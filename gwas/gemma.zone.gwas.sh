#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma.covar-stdout-%j.txt
#SBATCH -e gemma.covar-stderr-%j.txt
#SBATCH -J gemma.covar

cd ~/admixture_mapping/analysis/gwas/

#all pops, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/temp.af.bc.pheno \
	-a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.zone.covar \
	-o af.bc.zone

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.zone.covar \
	-o N_S.remove.zone



