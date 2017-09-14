#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma.covar-stdout-%j.txt
#SBATCH -e gemma.covar-stderr-%j.txt
#SBATCH -J gemma.covar

cd ~/admixture_mapping/analysis/gwas/

## pchl, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl_mass_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -bslmm 1 \
        -maf 0.01 \
        -miss 0.2 \
	-w 5000000 \
	-s 25000000 \
        -o cb.pchl.bslmm

## mo2, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/mo2_mass_cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
        -bslmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -w 5000000 \
        -s 25000000 \
        -o cb.mo2.bslmm

## hploe, mass corrected phenotypes

~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/hploe_mass_cb.pheno \
	-a ~/admixture_mapping/variants/gwas/cb.snp.annotate \
	-bslmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -w 5000000 \
        -s 25000000 \
	-o cb.hploe.bslmm
