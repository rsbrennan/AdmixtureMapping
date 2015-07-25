#!/bin/bash -l



cd /home/rsbrenna/Admixture_Mapping/aligned/


for i in $(ls *.aligned.sam | rev | cut -c 13- |rev)

do { 
	ONE=$(/usr/bin/samtools view -c -S -F 4 ${i}.aligned.sam) #mapped reads
	TWO=$(/usr/bin/samtools view -c -S -f 4 ${i}.aligned.sam) #unmapped reads
	echo ${i},$ONE,$TWO 

  } >> alignment.results.txt


done 
