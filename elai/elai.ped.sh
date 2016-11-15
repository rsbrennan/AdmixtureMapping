#!/bin/bash

for chrom in {1..24}; do
	sed 's/chr//g' PL-chrom.vcf | ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
	--out ~/admixture_mapping/variants/plink/chr${chrom}.PL

done


#for chrom in {1..24}; do
#        sed 's/chr//g' PP-chrom.vcf |  ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
#        --out ~/admixture_mapping/variants/plink/chr${chrom}.PP

#done


#for chrom in {1..24}; do
#         sed 's/chr//g' AF-chrom.vcf |  ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
#         --out ~/admixture_mapping/variants/plink/chr${chrom}.AF

#done


#zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | sed 's/Chrom//g' |\
#~/bin/vcftools/bin/vcftools --vcf - --plink \
#--out ~/admixture_mapping/variants/plink/cb-all.70.chrom

