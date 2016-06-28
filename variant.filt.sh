#!/bin/bash -l

~/bin/vcflib/bin/vcffilter -f "DP > 5 & DP < 516 & QUAL > 20" /home/rsbrenna/admixture_mapping/variants/AM-1-variants.vcf \
> AM-1-variants.filt.vcf
