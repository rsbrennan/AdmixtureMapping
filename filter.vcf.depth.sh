#!/bin/bash -l


#~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/cb-all.filtered.vcf.gz \
#--recode --recode-INFO-all --positions snp.70cov.list --stdout | bgzip > ~/admixture_mapping/variants/cb-all.70.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/cb-all.70.vcf.gz
