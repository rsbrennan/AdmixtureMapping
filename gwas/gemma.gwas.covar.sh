#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma.covar-stdout-%j.txt
#SBATCH -e gemma.covar-stderr-%j.txt
#SBATCH -J gemma.covar


cd ~/admixture_mapping/analysis/gwas/

#### using genotypes

#af and bc together
~/bin/gemma -g ~/admixture_mapping/variants/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/temp.pheno \
	-a ~/admixture_mapping/variants/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.thin.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.covar \
	-o af.bc

#af alone
~/bin/gemma -g ~/admixture_mapping/variants/af.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.AF.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.thin.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.covar \
        -o af

#bc alone
~/bin/gemma -g ~/admixture_mapping/variants/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.BC.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.covar \
        -o bc

# all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/temp.BC.pheno \
        -a ~/admixture_mapping/variants/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/ac.alone.global.covar \
        -o bc
#CB pops, including parents

#AC pops, including parents

## Local ancestry
#can't include parental pops here bc ancestry would be identical for all 
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