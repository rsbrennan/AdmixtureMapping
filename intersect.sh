#!/bin/bash -l

cd ~/admixture_mapping/variants/

vcf-isec -n +2 PL.vcf.gz PP.vcf.gz -f |bgzip -c > overlap.2.vcf.gz
