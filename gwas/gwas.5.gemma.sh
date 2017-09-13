#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma.covar-stdout-%j.txt
#SBATCH -e gemma.covar-stderr-%j.txt
#SBATCH -J gemma.covar

cd ~/admixture_mapping/analysis/gwas/

##
## cb individuals only
##

## ctmax, no mass correction needed

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/ctmax_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
	-maf 0.01 \
	-miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.covar \
        -o cb.ctmax.masscorrect

## hploe, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.hploe.covar \
        -o cb.hploe.masscovar

## mo2, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/mo2_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.mo2.covar \
        -o cb.mo2.masscovar


## pchl, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.pchl.covar \
        -o cb.pchl.masscovar

###############################################
## site as covariate + mass
###############################################

## hploe, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.site.hploe.covar \
        -o cb.hploe.sitecovar

## mo2, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/mo2_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.site.mo2.covar \
        -o cb.mo2.sitecovar


## pchl, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -c ~/admixture_mapping/analysis/gwas/cb.site.pchl.covar \
        -o cb.pchl.sitecovar


