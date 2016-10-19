#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/AC/run-1/AC-1/

for i in $(ls *.bam | cut -c -10)
do

~/bin/samtools-1.3.1/samtools view -b -h -F 0x0004 -F 0x0400 ${i}.bam | \
bedtools coverage -abam stdin \
-b ~/admixture_mapping/scripts/SbfI_List.txt -d\
> ~/admixture_mapping/summary_files/depth/AC/${i}.rad.depth.txt

done
