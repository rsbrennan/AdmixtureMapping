#!/bin/bash 
module load samtools
cd /home/rsbrenna/admixture_mapping/processed_data/radtag_checked/
 
for i in $(ls *.fq | rev | cut -c 6- | rev | uniq)
do
~/bin/stacks-1.34/clone_filter -1 ${i}.1.fq -2 ${i}.2.fq -o ~/admixture_mapping/processed_data/dupremoved 


done
