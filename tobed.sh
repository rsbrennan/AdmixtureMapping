#!/bin/bash

cd ~/admixture_mapping/variants/

~/bin/plink --file AM-1-variants.filter --make-bed --allow-extra-chr --out AM-1-variants.filter
