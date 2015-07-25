#!/bin/bash 
module load samtools
cd /home/rsbrenna/Admixture_Mapping/aligned
 
for i in $(ls *.aligned.sam | rev | cut -c 13-| rev | uniq)
do 

samtools view -b -S ${i}.aligned.sam > ${i}.bam

done
