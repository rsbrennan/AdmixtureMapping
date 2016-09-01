#!/bin/bash -l


#This renames column one in the second file based on the match from the first file, convert.scaff.name.txt. 
#Also changes spaces to tabs (to make vcf normal compatible w/ most programs) via tr command
#outputs vcf.gz and indexes the vcf with tabix.

awk 'FNR==NR { a[$1]=$2; next } $1 in a { $1=a[$1] }1' \
~/reference/convert.scaff.name.txt ~/admixture_mapping/variants/cb-all.70.vcf |\
tr ' ' '\t' |\
bgzip > ~/admixture_mapping/variants/cb-all.70.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/cb-all.70.vcf.gz



