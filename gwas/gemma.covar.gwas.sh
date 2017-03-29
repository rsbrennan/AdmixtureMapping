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
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.covar \
	-o af.bc.covar

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.covar \
	-o N_S.remove.covar

#CB, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.af.pheno \
        -a ~/admixture_mapping/variants/gwas/af.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.covar \
        -o af.covar

#CB, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.all.global.covar \
        -o cb.covar

#AC, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.covar \
        -o bc.covar

#AC, indlucing parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/ac.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.ac.pheno \
        -a ~/admixture_mapping/variants/gwas/ac.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/ac.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.all.global.covar \
        -o ac.covar





