#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gemma-stdout-%j.txt
#SBATCH -e gemma-stderr-%j.txt
#SBATCH -J gemma


cd ~/admixture_mapping/analysis/gwas/


#hploe, need to include mass as a covariate

#### admix prop as covariate, genotypes ######

#all pops, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/hploe.af.bc.pheno \
	-a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.hyp.covar \
	-o af.bc.covar.hypoxia

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.hyp.covar \
	-o N_S.remove.covar.hypoxia

#CB, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.af.pheno \
        -a ~/admixture_mapping/variants/gwas/af.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.hyp.covar \
        -o af.covar.hypoxia

#CB, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/cb.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.cb.pheno \
        -a ~/admixture_mapping/variants/gwas/cb.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/cb.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.all.global.hyp.covar \
        -o cb.covar.hypoxia

#AC, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/bc.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.hyp.covar \
        -o bc.covar.hypoxia

#AC, indlucing parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/ac.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.ac.pheno \
        -a ~/admixture_mapping/variants/gwas/ac.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/ac.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.all.global.hyp.covar \
        -o ac.covar.hypoxia


#### admix prop as covariate, local ancestry ######

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/hploe.af.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.hyp.covar \
        -o af.bc.local.hypoxia

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/af.local.gemma \
        -p ~/admixture_mapping/phenotypes/hploe.af.pheno  \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/cb.alone.global.hyp.covar \
        -o af.local.hypoxia

~/bin/gemma -g ~/admixture_mapping/analysis/gwas/bc.local.gemma \
        -p ~/admixture_mapping/phenotypes/hploe.bc.pheno \
        -a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/bc.thin.cXX.txt \
        -lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/ac.alone.global.hyp.covar \
        -o bc.local.hypoxia

#### admix prop + hybrid zone as covariate, genotypes ######


#all pops, no parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bc.bimbam.geno \
	-p ~/admixture_mapping/phenotypes/hploe.af.bc.pheno \
	-a ~/admixture_mapping/variants/gwas/af.bc.snp.annotate \
	-k ~/admixture_mapping/analysis/gwas/output/af.bc.cXX.txt \
	-lmm 1 \
	-c ~/admixture_mapping/analysis/gwas/all.alone.global.zone.hyp.covar \
	-o af.bc.zone.hypoxia

#all pops, including parents
~/bin/gemma -g ~/admixture_mapping/variants/gwas/N_S.remove.bimbam.geno \
        -p ~/admixture_mapping/phenotypes/hploe.N_S.remove.pheno \
        -a ~/admixture_mapping/variants/gwas/N_S.remove.snp.annotate  \
        -k ~/admixture_mapping/analysis/gwas/output/N_S.remove.cXX.txt \
        -lmm 1 \
        -c ~/admixture_mapping/analysis/gwas/all.global.zone.hyp.covar \
	-o N_S.remove.zone.hypoxia


