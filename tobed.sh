#!/bin/bash

cd ~/admixture_mapping/variants/

sed -i 's/^/x/' AC-run-1_CB.map

#think markers for ld
~/bin/plink --file AC-run-1_CB --indep 50 5 2 --allow-extra-chr -out plink.AC-cb.ld

#change to bed
~/bin/plink --file AC-run-1_CB --extract plink.AC-cb.ld.prune.in --make-bed --allow-extra-chr \
--out AC-run-1_CB
