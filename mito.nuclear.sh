#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o mito_nuclear-stdout-%j.txt
#SBATCH -e mito_nuclear-stderr-%j.txt
#SBATCH -J mito_nuclear

module load vcftools/0.1.13

cd ~/admixture_mapping/variants

# subset to AF only

zcat ~/admixture_mapping/variants/cb.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/AF.indivs \
--maf 0.05 \
--recode --out AF

#convert to bimbam
#first to plink

cd ~/admixture_mapping/variants/gwas/

	#convert to ped
	vcftools --vcf ~/admixture_mapping/variants/AF.recode.vcf \
	--plink --chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
	--out ~/admixture_mapping/variants/gwas/AF

	#ped to raw
	~/bin/plink-1.07-i686/plink --noweb \
	--file ~/admixture_mapping/variants/gwas/AF \
        --recodeA --out ~/admixture_mapping/variants/gwas/AF

# convert plink to bimbam in R

R CMD BATCH ~/admixture_mapping/scripts/gwas/allele.count.AF.R

# generate mitotype "phenotype" file

R CMD BATCH ~/admixture_mapping/scripts/gwas/gwas_mito_format.R

#calculate relatedness

cd ~/admixture_mapping/analysis/gwas/

~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bimbam.geno \
	-gk 1 -p ~/admixture_mapping/analysis/gwas/af.mito.pheno -o af

# run gwas

~/bin/gemma -g ~/admixture_mapping/variants/gwas/af.bimbam.geno \
        -p ~/admixture_mapping/analysis/gwas/af.mito.pheno \
        -a ~/admixture_mapping/variants/gwas/af.snp.annotate \
        -k ~/admixture_mapping/analysis/gwas/output/af.cXX.txt \
        -lmm 1 \
        -maf 0.01 \
        -miss 0.2 \
        -o af.mito

########################
###
### plink fischer's exact test
###
#######################

# already in plink format, from above.

#
# format mitotypes
#

cd ~/admixture_mapping/analysis/gwas/

cat ~/admixture_mapping/analysis/gwas/af.mito.pheno | sed 's/0/2/g' | sed 's/NA/0/g' \
	> ~/admixture_mapping/analysis/gwas/af.mito

# add mitotypes to ped file in col 6

cut -f 1-5 ~/admixture_mapping/variants/gwas/AF.ped > col.1
cut -f 7- ~/admixture_mapping/variants/gwas/AF.ped > col.2

#make new ped with mitotypes
paste col.1 ~/admixture_mapping/analysis/gwas/af.mito  | paste - col.2 > ~/admixture_mapping/variants/gwas/AF.mito.ped

#remove unused files
rm col.1
rm col.2

cp ~/admixture_mapping/variants/gwas/AF.map ~/admixture_mapping/variants/gwas/AF.mito.map

#run fisher's exact test
~/bin/plink-1.07-i686/plink --noweb \
--file ~/admixture_mapping/variants/gwas/AF.mito \
--allow-no-sex \
--fisher \
--out af
