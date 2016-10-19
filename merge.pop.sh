#!/bin/bash -l
#SBATCH -J merge.pops
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu


cd ~/admixture_mapping/processed_data/aligned/AC/run-1
my_bamtools=~/bin/bamtools/bin/bamtools
pop=BC

$my_bamtools merge -list ~/admixture_mapping/scripts/bam.BC.list |\
~/bin/samtools-1.3.1/samtools sort - -T $i.temp -O bam -o \
~/admixture_mapping/processed_data/aligned/AC/run-1/$pop.all.bam

