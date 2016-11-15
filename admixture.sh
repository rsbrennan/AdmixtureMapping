#!/bin/bash

cd ~/admixture_mapping/variants/

#sed -i 's/x//g' AC-run-1_CB.bim


for K in 1 2 3 4 5 6 7 8;
	do ~/bin/admixture_linux-1.23/admixture --cv AC-run-1_CB.bed $K | tee log${K}.out; done
