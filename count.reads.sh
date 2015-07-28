#!/bin/bash -l

# count all 
#wc -l *.fastq  > demultiplexed.read.counts.txt

#!/bin/bash -l
  
cd /home/rsbrenna/admixture_mapping/rawdata/ 
 
for i in $(ls *.fastq | cut -c 16-| cut -c -9)
 
do { 
FORWARD=$(cat RSB-AM-CB-1_RA_${i}.fastq | wc -l) #forward reads
REVERSE=$(cat RSB-AM-CB-1_RB_${i}.fastq | wc -l) #reverse reads
echo ${i},$FORWARD,$REVERSE 
 
  } >> read.counts.results.txt
  
done 
