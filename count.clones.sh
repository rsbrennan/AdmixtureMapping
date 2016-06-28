#!/bin/bash -l

# count all 
#wc -l *.fastq  > demultiplexed.read.counts.txt

#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/processed_data/dupremoved/

for i in $(ls *.fil* | cut -c -13 | uniq)

do {
FORWARD=$(cat ${i}.1.fil.fq_1 | wc -l) #forward reads
REVERSE=$(cat ${i}.2.fil.fq_2 | wc -l) #reverse reads
echo ${i},$FORWARD,$REVERSE 
 
  } >> clone.counts.results.txt
  
done 
