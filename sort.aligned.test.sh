#!/bin/bash 
module load samtools
cd /home/rsbrenna/Admixture_Mapping/aligned

samtools view -b -S AF-486-01.aligned.sam > AF-486-01.bam
 
samtools sort AF-486-01.bam /home/rsbrenna/Admixture_Mapping/aligned/AF-486-01.sort
java -jar ~/bin/picard-tools-1.96/AddOrReplaceReadGroups.jar I= /home/rsbrenna/Admixture_Mapping/aligned/AF-486-01.sort.bam O= /home/rsbrenna/Admixture_Mapping/aligned/AF-486-01.sort.rg.bam RGID= AM-1 RGSM= AF-486-01 RGPU= x RGLB= AM-1 RGPL= Illumina  

