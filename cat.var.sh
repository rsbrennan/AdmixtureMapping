#!/bin/bash -l

vcf-concat $(ls -1 ~/admixture_mapping/variants/cb-combined/*.vcf | perl -pe 's/\n/ /g') |\
gzip -c > ~/admixture_mapping/variants/cb-all.vcf

