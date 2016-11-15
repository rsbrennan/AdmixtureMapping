#!/bin/bash -l

cd ~/admixture_mapping/variants/

zcat ~/admixture_mapping/variants/AC-run-1.filtered.vcf.gz | grep '^#' > header.ac.txt
grep '^chr*' ~/admixture_mapping/variants/AC-run-1.filtered.chrom.vcf | cat header.ac.txt - |\
~/bin/vcftools/perl/vcf-sort -c | awk -v OFS="\t" '$1=$1'|  bgzip > ~/admixture_mapping/variants/AC-run-1.filtered.chrom.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/AC-run-1.filtered.chrom.vcf.gz
