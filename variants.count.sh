#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/processed_data/aligned/

for i in $(ls *.sort.rg.bam.bai | cut -c -13 | uniq)

do {

COUNT=$(vcf-subset -e -c ${i} /home/rsbrenna/admixture_mapping/variants/AM-1-variants.filt.vcf | grep -v ^# | wc -l)
echo ${i},$COUNT

} >> /home/rsbrenna/admixture_mapping/variants/variant.counts.txt

done

