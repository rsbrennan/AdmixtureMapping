#!/bin/bash -l

# count all 
#wc -l *.fastq  > demultiplexed.read.counts.txt

#!/bin/bash -l
  
cd /home/rsbrenna/admixture_mapping/dupremoved/ 
 
for i in $(ls *.fil* | cut -c 4-| cut -c -9 | uniq)
 
do { 
FORWARD=$(cat RA_${i}.fil.fq_1 | wc -l) #forward reads
REVERSE=$(cat RB_${i}.fil.fq_2 | wc -l) #reverse reads
echo ${i},$FORWARD,$REVERSE 
 
  } >> clone.counts.results.txt
  
done 
