#!/bin/bash

cd ~/admixture_mapping/variants/

~/bin/plink --file cb-all.70.plink --make-bed --allow-extra-chr \
--out cb-all.70
