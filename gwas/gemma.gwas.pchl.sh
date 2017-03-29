#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma-stdout-%j.txt
#SBATCH -e gemma-stderr-%j.txt
#SBATCH -J gemma

cd ~/admixture_mapping/analysis/gwas/

#pchl, need to include mass as a covariate

#### admix prop as covariate, genotypes ######

#all pops, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/pchl.af.bc.pheno \
	-a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.pchl.covar \
	-o af.bc.covar.pchl

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.pchl.covar \
	-o N_S.remove.covar.pchl

#CB, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.af.pheno \
        -a ~/admixture_mapping/variants/gwas/af.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.pchl.covar \
        -o af.covar.pchl

#CB, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.all.global.pchl.covar \
        -o cb.covar.pchl

#AC, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.pchl.covar \
        -o bc.covar.pchl

#AC, indlucing parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/ac.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.ac.pheno \
        -a ~/admixture_mapping/variants/gwas/ac.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/ac.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.all.global.pchl.covar \
        -o ac.covar.pchl


#### admix prop as covariate, local ancestry ######

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/pchl.af.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.pchl.covar \
        -o af.bc.local.pchl

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.local.gemma \
        -p ~/admixture_mapping/phenotypes/pchl.af.pheno  \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.pchl.covar \
        -o af.local.pchl

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/pchl.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.pchl.covar \
        -o bc.local.pchl

#### admix prop + hybrid zone as covariate, genotypes ######


#all pops, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/pchl.af.bc.pheno \
	-a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.zone.pchl.covar \
	-o af.bc.zone.pchl

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/pchl.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.zone.pchl.covar \
	-o N_S.remove.zone.pchl


