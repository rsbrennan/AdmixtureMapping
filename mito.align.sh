#!/bin/bash -l

module load bowtie2

#location of indexes
export BOWTIE2_INDEXES=~/reference

cd /home/rsbrenna/admixture_mapping/processed_data/dupremoved/

#run with sbatch -p hi -c 24 alignment.sh



bowtie2 --sensitive-local -p24 -q -x Fheteroclitus_mitochondrion -1 AF-494-09_016.1.fil.fq_1 -2 AF-494-09_016.2.fil.fq_2 | samtools view -b -S - > ~/admixture_mapping/AF-494-09_016.mito.bam

