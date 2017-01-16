#!/bin/bash -l

# mod 2017-01-11

cd ~/admixture_mapping/processed_data/aligned/AC/run-1/AC-1/

for i in $(ls *.bam)

do {
samtools index ${i}
  }
done
