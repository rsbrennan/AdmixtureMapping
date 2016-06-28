#!/bin/bash -l

# count all
#cd ~/admixture_mapping/processed_data/demultiplex/CB-4/
#wc -l *.fastq  > ~/admixture_mapping/summary_files/demultiplexed.all.CB-4.txt

#Count individual demultiplexed illumina barcodes

cd ~/admixture_mapping/rawdata/2016/cb-renorm/

for i in $(ls *R1_001.fastq.gz | cut -c -15 )

do {
FORWARD=$(zcat ${i}R1_001.fastq.gz | wc -l) #forward reads
REVERSE=$(zcat ${i}R2_001.fastq.gz | wc -l) #reverse reads
echo ${i},$FORWARD,$REVERSE

  } >> rawreads.cb-renorm.txt

done
