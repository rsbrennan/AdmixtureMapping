#!/bin/bash -l

intersectBed -wa -abam ~/admixture_mapping/processed_data/aligned/CB-1/cb-1.all.bam \
-b ~/reference/SbfI_List.bed > ~/admixture_mapping/summary_files/cb-4.bam.hist.all.txt \
> ~/admixture_mapping/summary_files/cb-1.ontarget.bam
