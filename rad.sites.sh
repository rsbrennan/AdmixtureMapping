#!/bin/bash -l



cd ~/admixture_mapping/processed_data/aligned/local_align/


for i in $(ls *.bam | rev | cut -c 13- |rev)

do { 
	ONE=$(/usr/bin/samtools view -F 4 -f 0x0040 -F 16 ${i}.bam  | cut -f 3-4 |uniq | wc -l) #count rad sites
	echo ${i},$ONE

  } >> rad.sites.txt


done 
