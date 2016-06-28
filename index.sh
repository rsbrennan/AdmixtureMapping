#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/cb-renorm/CB-2/

for i in $(ls *.bam)

do {
samtools index ${i}
  }
done
