#!/bin/bash -l

cd ~/admixture_mapping/variants/

bedtools intersect -a ~/admixture_mapping/variants/outliers.bed -b ~/reference/kfish2.mRNA.gff -wb | cut -f 6,12 | grep ^gene | cut -f 2 | cut -d ';' -f 1 | cut -d ':' -f 2 | sort -n | uniq > outliers.list

