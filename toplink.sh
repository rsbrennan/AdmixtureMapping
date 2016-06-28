#!/bin/bash


zcat out.vcf.gz | sed 's/NW_//g' | awk 'NR>62 {sub(/..$/, "", $1)} 1' | unexpand  > out.filter.1.vcf

~/bin/vcftools/bin/vcftools --vcf out.filter.1.vcf --max-missing 0.3 --plink --out out.plink

#/home/rsbrenna/bin/plink --file AM-1-variants.filter --make-bed  --allow-extra-chr --out AM-1-variants.filter

#~/bin/vcftools/bin/vcftools --vcf AM-1-variants.filter.vcf --keep admixed.list --plink --out admixed
