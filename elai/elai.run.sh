#!/bin/bash -l

cd ~/admixture_mapping/elai/

RANDOM=`date +%N|sed s/...$//`

for chr in {1..6}; do
	for run in {1..5}; do
		~/bin/elai/elai-lin -g ~/admixture_mapping/variants/bimbam/chr${chr}.PL.recode.geno.inp -p 10 \
		-g ~/admixture_mapping/variants/bimbam/chr${chr}.PP.recode.geno.inp -p 11 \
		-g ~/admixture_mapping/variants/bimbam/chr${chr}.AF.recode.geno.inp -p 1 \
		-pos ~/admixture_mapping/variants/bimbam/chr${chr}.PP.recode.pos.txt  \
		-R $RANDOM \
		-s 30 \
		-o chr${chr}.${run} \
		-C 2 \
		-c 10 \
		-mg 200
	done

done
