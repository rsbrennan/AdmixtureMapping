#!/bin/bash -l

module load Bowtie2/2.0.2-goolf-1.4.10

#location of indexes
export BOWTIE2_INDEXES=/home/rsbrenna/reference

cd /home/rsbrenna/Admixture_Mapping/rawdata/

#run with sbatch -p hi -c 24 alignment.sh

for i in $(ls *GG.fastq | cut -c 16-| rev | cut -c 7- | rev | uniq)

do 

bowtie2 --very-sensitive -p24 -q -x killifish20130322asm -1 RSB-AM-CB-1_RA_${i}.fastq -2 RSB-AM-CB-1_RB_${i}.fastq  -S /home/rsbrenna/Admixture_Mapping/aligned/${i}.aligned.sam

done

