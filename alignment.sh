#!/bin/bash -l

module load Bowtie2/2.0.2-goolf-1.4.10

#location of indexes
export BOWTIE2_INDEXES=/home/rsbrenna/reference

cd /home/rsbrenna/admixture_mapping/dupremoved/

#run with sbatch -p hi -c 24 alignment.sh

for i in $(ls *.fil.fq_1 | cut -c 4-| rev | cut -c 10- | rev | uniq)

do 

bowtie2 --very-sensitive-local -p24 -q -x killifish20130322asm -1 RA_${i}.fil.fq_1 -2 RB_${i}.fil.fq_2  -S /home/rsbrenna/admixture_mapping/aligned/${i}.aligned.sam

done

