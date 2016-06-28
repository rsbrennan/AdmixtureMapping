#!/bin/bash -l

cd ~/admixture_mapping/variants

#PP
#vcf-subset -e -c ~/admixture_mapping/scripts/PP.txt /home/rsbrenna/admixture_mapping/variants/AM-1-variants.vcf | \
#~/bin/vcftools/bin/vcftools --vcf - --min-alleles 2 --max-alleles 2 --maf .05 --max-missing 0.5 --recode --recode-INFO-all --out PP

#PL
#vcf-subset -e -c ~/admixture_mapping/scripts/PL.txt /home/rsbrenna/admixture_mapping/variants/AM-1-variants.vcf | \
#~/bin/vcftools/bin/vcftools --vcf - --min-alleles 2 --max-alleles 2 --maf .05 --max-missing 0.2 --recode --recode-INFO-all --out PL


#AF
#vcf-subset -e -c ~/admixture_mapping/scripts/AF.txt /home/rsbrenna/admixture_mapping/variants/AM-1-variants.vcf | \
#~/bin/vcftools/bin/vcftools --vcf - --min-alleles 2 --max-alleles 2 --maf .05 --max-missing 0.2 --recode --recode-INFO-all --out AF

#all pops
~/bin/vcftools/bin/vcftools --vcf /home/rsbrenna/admixture_mapping/variants/AM-1-variants.vcf \
--min-alleles 2 --max-alleles 2 --maf 0.3 --max-maf 0.7 --max-missing 0.5 --recode --recode-INFO-all --out rapture.variants.all..vcf
