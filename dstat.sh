#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/CB-4/

~/bin/angsd/angsd -out d_stat \
-doAbbababa 1 \
-bam ~/admixture_mapping/scripts/abbababa.list.txt \
-doCounts 1 \
-blockSize 100000 \
-anc ~/reference/maj.fasta

