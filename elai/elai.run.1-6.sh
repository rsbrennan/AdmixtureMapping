#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o elai-1-6-stdout-%j.txt
#SBATCH -e elai-1-6-stderr-%j.txt
#SBATCH -J elai-1-6

cd ~/admixture_mapping/analysis/elai/

RANDOM=`date +%N|sed s/...$//`
GEN=100
P1=PL #PL or HP
P2=PP #PP or PC
ADMIX=AF #AF or BC

for chr in {1..6}; do
	for run in {1..5}; do
		~/bin/elai-lin2 \
		-g ~/admixture_mapping/variants/bimbam/chr${chr}.${P1}.recode.geno.inp -p 10 \
		-g ~/admixture_mapping/variants/bimbam/chr${chr}.${P2}.recode.geno.inp -p 11 \
		-g ~/admixture_mapping/variants/bimbam/chr${chr}.${ADMIX}.recode.geno.inp -p 1 \
		-pos ~/admixture_mapping/variants/bimbam/chr${chr}.${P1}.recode.pos.txt.1  \
		-R $RANDOM \
		-s 30 \
		-o ${ADMIX}.chr${chr}.${run}.${GEN} \
		-C 2 \
		-c 10 \
		-mg $GEN
	done

done
