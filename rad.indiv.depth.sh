#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/CB-4/

for i in $(ls AF*.bam | cut -c -10)
do

~/bin/samtools-1.3.1/samtools view -b -h -F 0x0004 -F 0x0400 ${i}.bam | \
bedtools coverage -abam stdin \
-b ~/reference/SbfI_List.bed -d\
> ~/admixture_mapping/summary_files/${i}.rad.depth.txt

done
