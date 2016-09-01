#!/bin/bash

cd ~/admixture_mapping/variants/

#zcat out.vcf.gz | sed 's/NW_//g' | awk 'NR>62 {sub(/..$/, "", $1)} 1' | unexpand  > out.filter.1.vcf


zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - --plink --out cb-all.70

#/home/rsbrenna/bin/plink --file AM-1-variants.filter --make-bed  --allow-extra-chr --out AM-1-variants.filter

#~/bin/vcftools/bin/vcftools --vcf AM-1-variants.filter.vcf --keep admixed.list --plink --out admixed


