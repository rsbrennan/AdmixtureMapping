#!/bin/bash -l 

cd ~/admixture_mapping/processed_data/aligned/CB-4/

vcftools --gzvcf ~/admixture_mapping/scripts/FD_FM.vcf.gz \
--indv Fmajal-001 \
--indv Fmajal-002 \
--indv Fmajal-003 \
--indv Fmajal-004 \
--indv Fmajal-005 \
--indv Fmajal-006 \
--indv Fmajal-007 \
--indv Fmajal-008 \
--indv Fmajal-009 \
--indv Fmajal-010 \
--recode \
--out majalis
