#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/aligned/

for i in $(ls *.sort.rg.bam)

do {
samtools index ${i}
  }
done
