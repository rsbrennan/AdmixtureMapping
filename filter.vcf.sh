#!/bin/bash -l

cd ~/admixture_mapping/variants/

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/cb-all.vcf.gz \
--recode --recode-INFO-all --maf 0.05 --max-missing 0.5 \
--min-alleles 2 --max-alleles 2 \
--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/cb-all.filtered.vcf

tabix -p vcf ~/admixture_mapping/variants/cb-all.filtered.vcf


