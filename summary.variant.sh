#!/bin/bash -l

zcat ~/admixture_mapping/variants/AC-run-1.vcf.gz | ~/bin/vcftools/bin/vcf-annotate --fill-type | grep -oP "TYPE=\w+" | sort | uniq -c
