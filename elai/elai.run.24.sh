#!/bin/bash -l

cd ~/admixture_mapping/elai/

RANDOM=`date +%N|sed s/...$//`

for run in {1..5}; do
	~/bin/elai/elai-lin -g ~/admixture_mapping/variants/bimbam/chr24.PL.recode.geno.inp -p 10 \
	-g ~/admixture_mapping/variants/bimbam/chr24.PP.recode.geno.inp -p 11 \
	-g ~/admixture_mapping/variants/bimbam/chr24.AF.recode.geno.inp -p 1 \
	-pos ~/admixture_mapping/variants/bimbam/chr24.PP.recode.pos.txt.1  \
	-R $RANDOM \
	-s 30 \
	-o chr${chr}.100.${run} \
	-C 2 \
	-c 10 \
	-mg 200
done


