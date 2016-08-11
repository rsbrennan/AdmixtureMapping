#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/cb-combined/

for i in $(ls *.bam)

do {
samtools index ${i}
  }
done
