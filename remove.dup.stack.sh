#!/bin/bash 
module load samtools
cd /home/rsbrenna/admixture_mapping/rawdata
 
for i in $(ls *.fastq | rev | cut -c 7-| rev | cut -c 16-| uniq)
do 
~/bin/stacks-1.34/clone_filter -1 RSB-AM-CB-1_RA_${i}.fastq -2 RSB-AM-CB-1_RB_${i}.fastq -o ~/admixture_mapping/dupremoved 


done
