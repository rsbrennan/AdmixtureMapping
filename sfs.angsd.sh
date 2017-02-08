#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o sfs.angsd-stdout-%j.txt
#SBATCH -e sfs.angsd-stderr-%j.txt
#SBATCH -J sfs.angsd

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
#bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

#use gatk likelihood method

# remove reads with low quality and/or with multiple hits, a

for POP in BC GA HP PC TR PP PL AF
do
	NUM=`cat ~/admixture_mapping/scripts/bam.$POP.list | wc -l`
	echo $POP
	echo $NUM
	INDIV=`echo $((NUM / 2))`
	MIN=`echo $((NUM * 5))`
	MAX=`echo $((NUM * 70))`
	  $ANGSD/angsd -P 8 -b ~/admixture_mapping/scripts/bam.$POP.list -ref $REF -anc $REF \
	-out ~/admixture_mapping/variants/$POP \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 30 -minInd $NUM -setMinDepth $MIN -setMaxDepth $MAX -doCounts 1 \
        -GL 1 -doSaf 1 -fold 1 -rf ~/admixture_mapping/scripts/angsd.scaff
done


for POP in BC GA HP PC TR PP PL AF
do
        echo $POP
        $ANGSD/misc/realSFS ~/admixture_mapping/variants/$POP.saf.idx -P 8 \
	> ~/admixture_mapping/variants/$POP.sfs
done
