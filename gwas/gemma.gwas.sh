#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma-stdout-%j.txt
#SBATCH -e gemma-stderr-%j.txt
#SBATCH -J gemma


cd ~/admixture_mapping/analysis/gwas/

~/bin/gemma -g ~/admixture_mapping/variants/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/temp.pheno \
	-a ~/admixture_mapping/variants/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.thin.cXX.txt \
	-lmm 1 \
	-o af.bc


~/bin/gemma -g ~/admixture_mapping/variants/af.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.AF.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.thin.cXX.txt \
        -lmm 1 \
        -o af

~/bin/gemma -g ~/admixture_mapping/variants/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.BC.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
        -o bc

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/temp.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/af.bc.thin.cXX.txt \
        -lmm 1 \
        -o af.bc.local

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.local.gemma \
        -p ~/admixture_mapping/phenotypes/temp.AF.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.thin.cXX.txt \
        -lmm 1 \
        -o af.local

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/temp.BC.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
        -o bc.local

