#!/bin/bash 
module load samtools
cd ~/admixture_mapping/processed_data/aligned
 
for i in $(ls *.aligned.sam | rev | cut -c 13-| rev | uniq)
do 

samtools view -b -S ${i}.aligned.sam > ${i}.bam

done
