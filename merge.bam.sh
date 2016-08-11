#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/cb-renorm/CB-1/
my_bamtools=~/bin/bamtools/bin/bamtools


for i in $(ls *.bam | cut -c -10 )

do {
$my_bamtools merge \
-in ~/admixture_mapping/processed_data/aligned/cb-renorm/CB-1/$i.bam \
-in ~/admixture_mapping/processed_data/aligned/cb-all/CB-1/$i.bam |\
~/bin/samtools-1.3.1/samtools sort - -T $i.temp -O bam -o \
~/admixture_mapping/processed_data/aligned/cb-combined/$i.combined.bam
  }

done
