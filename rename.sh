#!/bin/bash -l

awk 'FNR==NR { a[$1]=$2; next } $1 in a { $1=a[$1] }1' \
~/reference/convert.scaff.name.txt ~/admixture_mapping/variants/cb-all.70.vcf |\
tr ' ' '\t' |\
bgzip > ~/admixture_mapping/variants/cb-all.70.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/cb-all.70.vcf.gz



