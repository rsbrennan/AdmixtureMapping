#!/bin/bash -l

cd /home/rsbrenna/admixture_mapping/variants/

/home/rsbrenna/bin/plink --file af.70 --assoc \
--allow-extra-chr \
--pheno ~/admixture_mapping/scripts/af.pheno \
--adjust --all-pheno --missing-phenotype -9 --out gwas_cb.all
