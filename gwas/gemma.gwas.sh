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
        -k ~/admixture_mapping/analysis/gwas/output/cb.ctmax.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.covar \
        -o cb.ctmax.masscorrect

## hploe, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/hploe_mass_cb.pheno \
	-a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/cb.hploe.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.all.covar \
	-o cb.hploe.masscorrect

## hploe, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.hploe.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.hploe.covar \
        -o cb.hploe.masscovar


## mo2, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/mo2_mass_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.mo2.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.covar \
        -o cb.mo2.masscorrect

## mo2, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/mo2_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.mo2.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.mo2.covar \
        -o cb.mo2.masscovar

## pchl, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl_mass_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.pchl.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.covar \
        -o cb.pchl.masscorrect

## pchl, mass as covariate

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/cb.pchl.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/cb.all.pchl.covar \
        -o cb.pchl.masscovar
