#!/bin/bash -l

#vcf-concat $(ls -1 ~/admixture_mapping/variants/AC/run-1/*.vcf | perl -pe 's/\n/ /g') |\
#gzip -c > ~/admixture_mapping/variants/AC-run-1.vcf

### Merge files
vcf-merge ~/admixture_mapping/variants/cb-all.70.chrom.split.vcf.gz ~/admixture_mapping/variants/AC-run-1.filtered.chrom.vcf.gz |\
bgzip -c > ~/admixture_mapping/variants/AC-run-1_CB.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/AC-run-1_CB.vcf.gz
