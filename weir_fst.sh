#!/bin/bash -l

cd ~/admixture_mapping/analysis/

zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/variants/PL_PP.list \
--maf 0.05 \
--min-alleles 2 \
--max-alleles 2 \
--weir-fst-pop ~/admixture_mapping/variants/PL.list \
--weir-fst-pop ~/admixture_mapping/variants/PP.list \
--out PP_vs_PL
