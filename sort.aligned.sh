#!/bin/bash 
module load samtools
cd /home/rsbrenna/admixture_mapping/aligned
 
for i in $(ls PP*.bam | rev | cut -c 5-| rev | uniq)
do 

samtools sort ${i}.bam /home/rsbrenna/admixture_mapping/aligned/${i}.sort
#rm ${i}.aligned.sam
java -jar ~/bin/picard-tools-1.96/AddOrReplaceReadGroups.jar I= /home/rsbrenna/admixture_mapping/aligned/${i}.sort.bam O= /home/rsbrenna/admixture_mapping/aligned/${i}.sort.rg.bam RGID= AM-1 RGSM= ${i} RGPU= x RGLB= AM-1 RGPL= Illumina  
#rm /home/rsbrenna/Admixture_Mapping/aligned/${i}.sort.bam

done
