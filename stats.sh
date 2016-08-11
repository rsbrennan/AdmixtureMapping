#!/bin/bash -l


zcat ~/admixture_mapping/variants/cb-all.vcf.gz | ~/bin/vcftools/bin/vcftools --vcf - --depth -c > depth_summary.txt
