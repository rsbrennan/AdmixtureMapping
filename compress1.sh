#!/bin/bash -l

#gunzip -c  ~/admixture_mapping/rawdata/RSB-AM-CB-1_S209_L008_R1_001.fastq.gz > ~/admixture_mapping/rawdata/RSB-AM-CB-1_S209_L008_R1_001.fastq

#gzip ~/admixture_mapping/rawdata/RSB-AM-CB-1_S209_L008_R1_001.fastq

zcat ~/admixture_mapping/variants/cb-all.70.vcf.gz >\
~/admixture_mapping/variants/cb-all.70.vcf

