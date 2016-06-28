#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/processed_data/aligned/local_align/

for i in $(ls *.bam | rev | cut -c 5-| rev | uniq)

do {
samtools view -h -b -F 4 ${i}.bam > ${i}.aligned.bam
  }
done
