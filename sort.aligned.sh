#!/bin/bash 
module load samtools
cd /home/rsbrenna/Admixture_Mapping/aligned
 
for i in $(ls *.aligned.sam | rev | cut -c 13-| rev | uniq)
do 

samtools sort ${i}.bam /home/rsbrenna/Admixture_Mapping/aligned/${i}.sort
#rm ${i}.aligned.sam
java -jar ~/bin/picard-tools-1.96/AddOrReplaceReadGroups.jar I= /home/rsbrenna/Admixture_Mapping/aligned/${i}.sort.bam O= /home/rsbrenna/Admixture_Mapping/aligned/${i}.sort.rg.bam RGID= AM-1 RGSM= ${i} RGPU= x RGLB= AM-1 RGPL= Illumina  
#rm /home/rsbrenna/Admixture_Mapping/aligned/${i}.sort.bam

done
