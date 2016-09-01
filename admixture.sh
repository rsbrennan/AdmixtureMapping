#!/bin/bash

cd ~/admixture_mapping/variants/

sed -i 's/x//g' cb-all.70.bim

~/bin/admixture_linux-1.23/admixture cb-all.70.bed 2
