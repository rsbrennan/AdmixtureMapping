#!/bin/bash -l

zcat ~/admixture_mapping/variants/cb-all.filtered.vcf.gz | ~/bin/vcftools/bin/vcf-annotate --fill-type | grep -oP "TYPE=\w+" | sort | uniq -c
