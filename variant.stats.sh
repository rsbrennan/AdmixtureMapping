#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/variants/

#vcftools --vcf AM-1-variants.filt.vcf --out filt.stats.out


#!/bin/bash -l

#vcf-subset -c AF-497-12_077 /home/rsbrenna/admixture_mapping/variants/AM-1-variants.filt.vcf | \
~/bin/vcftools/bin/vcftools --vcf AF.relaxed.recode.vcf --SNPdensity 20000 --out AF.relaxed.20kb.out


#R CMD BATCH ~/admixture_mapping/scripts/variant.stats.R

#rm test.out.snpden

