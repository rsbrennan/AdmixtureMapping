#!/bin/bash -l

#bedtools coverage -hist -abam ~/admixture_mapping/processed_data/aligned/CB-1/cb-1.all.bam \
#-b ~/reference/SbfI_List.bed > ~/admixture_mapping/summary_files/cb-1.bam.hist.all.txt

#bedtools coverage -hist -abam ~/admixture_mapping/processed_data/aligned/CB-2/cb-2.all.bam \
#-b ~/reference/SbfI_List.bed > ~/admixture_mapping/summary_files/cb-2.bam.hist.all.txt

#bedtools coverage -hist -abam ~/admixture_mapping/processed_data/aligned/CB-3/cb-3.all.bam \
#-b ~/reference/SbfI_List.bed > ~/admixture_mapping/summary_files/cb-3.bam.hist.all.txt

#bedtools coverage -hist -abam ~/admixture_mapping/processed_data/aligned/CB-4/cb-4.all.bam \
#-b ~/reference/SbfI_List.bed > ~/admixture_mapping/summary_files/cb-4.bam.hist.all.txt

~/bin/samtools-1.3.1/samtools view -b -h -F 0x0004 -F 0x0400 \
~/admixture_mapping/processed_data/aligned/AC/run-1/AC-1/ | \
bedtools coverage -abam stdin \
-b ~/reference/SbfI_List.bed -b \
> ~/admixture_mapping/summary_files/AC-1.bam.hist.all.txt
