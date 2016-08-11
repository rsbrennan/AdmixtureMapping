#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/cb-combined/

for i in $(ls *.bam | cut -c -10)
do

~/bin/samtools-1.3.1/samtools view -b -h -F 0x0004 -F 0x0400 ${i}.combined.bam | \
bedtools coverage -abam stdin \
-b ~/reference/SbfI_List.bed -d\
> ~/admixture_mapping/summary_files/depth/${i}.rad.depth.txt

done
