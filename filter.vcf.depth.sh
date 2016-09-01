#!/bin/bash -l


~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/cb-all.filtered.vcf.gz \
--recode --recode-INFO-all --positions snp.70cov.list --out ~/admixture_mapping/variants/cb-all.70

#tabix -p vcf ~/admixture_mapping/variants/cb-all.70.vcf.gz
