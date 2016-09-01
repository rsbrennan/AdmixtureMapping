#!/bin/bash

cd ~/admixture_mapping/variants/

sed -i 's/^/x/' cb-all.70.map

#think markers for ld
~/bin/plink --file cb-all.70 --indep 50 5 2 --allow-extra-chr -out plink.ld

#change to bed
~/bin/plink --file cb-all.70 --extract plink.ld.prune.in --make-bed --allow-extra-chr \
--out cb-all.70
