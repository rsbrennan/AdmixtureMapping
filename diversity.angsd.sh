#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o theta.angsd-stdout-%j.txt
#SBATCH -e theta.angsd-stderr-%j.txt
#SBATCH -J theta.angsd

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
#bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

for POP in BC GA HP PC TR PP PL AF
do
    	echo $POP
	NUM=`cat ~/admixture_mapping/scripts/bam.$POP.list | wc -l`
	echo $POP
	echo $NUM
	INDIV=`echo $((NUM / 2))`
	MIN=`echo $((NUM * 5))`
	MAX=`echo $((NUM * 70))`
	$ANGSD/angsd -P 8 -b ~/admixture_mapping/scripts/bam.$POP.list -ref $REF  \
		-anc $REF \
		-out ~/admixture_mapping/variants/$POP \
                -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
                -minMapQ 20 -minQ 30 -minInd $INDIV -setMinDepth $MIN -setMaxDepth $MAX -doCounts 1 \
                -GL 1 -doSaf 1 -fold 1 -rf ~/admixture_mapping/scripts/angsd.scaff \
	        -doThetas 1 -pest ~/admixture_mapping/variants/$POP.sfs
done


