#!/bin/bash -l

cd ~/admixture_mapping/variants/

zcat cb-all.70.vcf.gz | grep '^#' > header.txt
grep '^chr*' cb-all.70.chrom.vcf | cat header.txt - |\
~/bin/vcftools/perl/vcf-sort -c | awk -v OFS="\t" '$1=$1'|  bgzip > ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz
