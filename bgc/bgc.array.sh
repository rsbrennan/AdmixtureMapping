#!/bin/bash -l
#SBATCH -J array_job
#SBATCH --array=1-10
#SBATCH -p med
#SBATCH --mem=2600
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o bgc-stdout-%j-%A_%a.txt
#SBATCH -e bgc-stderr-%j-%A_%a.txt
#SBATCH -J bgc

#CB or AC
POP=AC



module load pgi-12.6/hdf5-1.8.9
module load gsl/2.3
cd ~/admixture_mapping/analysis/bgc

echo ${POP}.${SLURM_ARRAY_TASK_ID}

~/bin/bgcdist/bgc \
	-a ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental1_BGC.txt \
	-b ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental2_BGC.txt \
	-h ~/admixture_mapping/variants/bgc/bgc_${POP}_Admixed_BGC.txt \
	-M ~/admixture_mapping/variants/bgc/map.txt \
	-F ${POP}.${SLURM_ARRAY_TASK_ID} \
	-O 1 \
	-x 5000\
	-n 2500 \
	-t 2 \
	-p 1 \
	-q 1 \
	-N 1 \
	-E 0.0001 \
	-m 0 \
	-D 43653.81 \
	-d 1 \
	-s 1 \
	-I 0 \
	-u 0.1 \
	-g 0.05 \
	-z 0.05 \
	-e 0.02
