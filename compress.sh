#!/bin/bash -l

#gzip ~/admixture_mapping/rawdata/RSB-AM-CB-1_S209_L008_R3_001.fastq

#gzip ~/admixture_mapping/rawdata/RSB-AM-CB-1_S209_L008_R1_001.fastq


#zcat CB-1.vcf.gz | bgzip  > CB-1.1.vcf.gz

#tabix -p vcf CB-1.1.vcf.gz

#zcat FD_FM.vcf.gz | bgzip  > FD_FM1.1.vcf.gz

#tabix -p vcf FD_FM1.1.vcf.gz

vcf-merge FD_FM1.1.vcf.gz CB-1.1.vcf.gz |bgzip -c > out.vcf.gz

