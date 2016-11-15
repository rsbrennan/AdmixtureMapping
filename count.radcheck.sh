#!/bin/bash -l


lib=AC-1

cd ~/admixture_mapping/processed_data/demultiplex/AC/run-1/$lib

for i in $(ls *R1_001.fastq | cut -c -10)

do {
FORWARD=$(cat ${i}_R1_001.fastq | wc -l) #forward reads
REVERSE=$(cat ${i}_R2_001.fastq | wc -l) #reverse reads
echo ${i},$FORWARD,$REVERSE

  } >> ~/admixture_mapping/summary_files/count.radcheck.$lib.txt

done
