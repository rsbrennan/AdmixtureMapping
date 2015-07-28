#!/bin/bash 
module load samtools
cd /home/rsbrenna/admixture_mapping/aligned
 
for i in $(ls *.aligned.sam | rev | cut -c 13-| rev | uniq)
do 

samtools view -b -S ${i}.aligned.sam > ${i}.bam

done
