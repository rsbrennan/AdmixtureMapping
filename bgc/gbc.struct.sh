#!/bin/bash -l

~/bin/plink_linux_i686/plink --vcf ~/admixture_mapping/variants/PL-chrom.vcf \
--recode structure --out ~/admixture_mapping/variants/PL-chrom


~/bin/plink_linux_i686/plink --vcf ~/admixture_mapping/variants/PP-chrom.vcf \
--recode structure --out ~/admixture_mapping/variants/PP-chrom

~/bin/plink_linux_i686/plink --vcf ~/admixture_mapping/variants/AF-chrom.vcf \
--recode structure --out ~/admixture_mapping/variants/AF-chrom
