#!/bin/bash -l

zcat ~/admixture_mapping/variants/cb-all.vcf.gz | vcf-annotate --fill-type |\
grep -oP "TYPE=\w+" | sort | uniq -c
