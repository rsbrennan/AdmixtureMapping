#!/bin/bash

cd ~/admixture_mapping/variants/

#/home/rsbrenna/bin/plink --vcf AF.strict.recode.vcf --blocks no-pheno-req --allow-extra-chr --out AF.hap

/home/rsbrenna/bin/plink --vcf AF.strict.recode.vcf --r2 inter-chr dprime \
--ld-window-r2 0.0 --allow-extra-chr --out AF.strict
