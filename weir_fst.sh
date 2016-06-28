#!/bin/bash -l

cd ~/admixture_mapping/variants

~/bin/vcftools/cpp/vcftools --vcf AM-1-variants.filter.vcf --keep ~/admixture_mapping/scripts/PL_PP.txt --weir-fst-pop ~/admixture_mapping/scripts/PP.txt --weir-fst-pop ~/admixture_mapping/scripts/PL.txt \
--fst-window-size 1000 --fst-window-step 100 --out PP_vs_PL
