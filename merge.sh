#!/bin/bash -l

gunzip -c FD_FM.vcf.gz | bgzip -c > FD_FM.1.vcf.gz && tabix -p vcf FD_FM.1.vcf.gz

gunzip -c CB-1.vcf.gz | bgzip -c > CB-1.1.vcf.gz && tabix -p vcf CB-1.1.vcf.gz

vcf-merge FD_FM.1.vcf.gz CB-1.1.vcf.gz |bgzip -c > out.1.vcf.gz
