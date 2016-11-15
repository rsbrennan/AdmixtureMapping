#!/bin/bash -l

cd ~/admixture_mapping/variants/

#~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/cb-all.vcf.gz \
#--remove-indv AF-634-141 \
#--remove-indv AF-635-142 \
#--remove-indv AF-636-143 \
#--remove-indv AF-637-144 \
#--remove-indv AF-638-145 \
#--remove-indv AF-639-146 \
#--remove-indv AF-640-147 \
#--remove-indv AF-641-148 \
#--remove-indv AF-506-244 \
#--recode --recode-INFO-all --maf 0.05 --max-missing 0.5 \
#--min-alleles 2 --max-alleles 2 \
#--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/cb-all.filtered.vcf.gz

#tabix -p vcf ~/admixture_mapping/variants/cb-all.filtered.vcf.gz

~/bin/vcftools/bin/vcftools --gzvcf ~/admixture_mapping/variants/AC-run-1.vcf.gz  \
--recode --recode-INFO-all --maf 0.05 --max-missing 0.8 \
--min-alleles 2 --max-alleles 2 \
--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/AC-run-1.filtered.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/AC-run-1.filtered.vcf.gz

