#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pi-stdout-%j.txt
#SBATCH -e pi-stderr-%j.txt
#SBATCH -J pi

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
#bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

for POP in BC GA HP PC TR PP PL AF
do
    	echo $POP
	echo $POP
	#index files
	$ANGSD/misc/thetaStat make_bed ~/admixture_mapping/variants/$POP.thetas.gz
	#do sliding window analysis
	$ANGSD/misc/thetaStat do_stat ~/admixture_mapping/variants/$POP.thetas.gz -nChr 11 \
	-outnames ~/admixture_mapping/variants/$POP.thetas
done


