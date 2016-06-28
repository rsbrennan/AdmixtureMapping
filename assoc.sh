#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/variants/

/home/rsbrenna/bin/plink --bfile admixed --assoc \
--allow-no-sex --pheno all.pheno.txt \
--adjust --all-pheno --missing-phenotype -9 --out gwas_admix
