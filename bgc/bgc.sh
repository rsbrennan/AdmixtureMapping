#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o bgc-stdout-%j.txt
#SBATCH -e bgc-stderr-%j.txt
#SBATCH -J bgc

#CB or AC
POP=CB

module load pgi-12.6/hdf5-1.8.9
module load gsl/2.3
cd ~/admixture_mapping/analysis/bgc

~/bin/bgcdist/bgc \
	-a ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental1_BGC.txt \
	-b ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental2_BGC.txt \
	-h ~/admixture_mapping/variants/bgc/bgc_${POP}_Admixed_BGC.txt \
	-M ~/admixture_mapping/variants/bgc/map.txt \
	-F ${POP} \
	-O 0 \
	-x 10000 \
	-n 1000 \
	-t 2 \
	-p 1 \
	-q 1 \
	-N 1 \
	-E 0.0001 \
	-m 0 \
	-D 43653.94 \
	-d 1 \
	-s 1 \
	-I 0 \
	-u 0.1 \
	-g 0.05 \
	-z 0.05 \
	-e 0.02

