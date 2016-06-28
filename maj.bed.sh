#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/CB-4/

~/bin/samtools-1.3.1/samtools merge - -bu Fmajal*.bam |\
#Fmajal-002.bam \
#Fmajal-003.bam \
#Fmajal-004.bam \
#Fmajal-005.bam \
#Fmajal-006.bam \
#Fmajal-007.bam \
#Fmajal-008.bam \
#Fmajal-009.bam \
#Fmajal-010.bam |\
~/bin/bedtools2/bin/bedtools bamtobed -i stdin > majalis.bed 
