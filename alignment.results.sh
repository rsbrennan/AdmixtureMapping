#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/cb-all/CB-1/

for i in $(ls *.bam | cut -c -10 | uniq )

do {
	ONE=$(samtools view -h -F 1024 ${i}.bam | samtools view -S -F 4 - | wc -l) #mapped reads
	TWO=$(samtools view -f 4 ${i}.bam | wc -l) #unmapped reads
	THREE=$(samtools view -f 1024 ${i}.bam | wc -l) #pcr duplicates
	FOUR=$(samtools view  ${i}.bam | wc -l) #total
	FIVE=$(samtools view -h -F 1024 ${i}.bam | samtools view -S -F 4 - | cut -f1 | sort | uniq | wc -l)
	echo ${i},$ONE,$TWO,$THREE,$FOUR,$FIVE

  } >> ~/admixture_mapping/summary_files/alignment.count.all-CB-1.txt


done
