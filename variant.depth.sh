#!/bin/bash -l

# mod 2017-01-11

#touch variant.depth.txt
#
#END=346
#
#for i in $(seq 10 $END)
#
#	do {
#		zcat ~/admixture_mapping/variants/cb-all.70.vcf.gz | grep -v '^#' |\
#		cut -f ${i} | cut -f 2 -d ":" > ~/admixture_mapping/variants/tmp/temp${i}.txt
#		}

#done

paste variant.depth.txt ~/admixture_mapping/variants/tmp/temp[0-9]*.txt > variant.depth.2.txt && mv variant.depth.2.txt variant.depth.txt 

rm ~/admixture_mapping/variants/tmp/temp*.txt


