#!/bin/bash -l
#SBATCH -J merge.pops
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu

# mod 2017-01-11

cd ~/admixture_mapping/processed_data/aligned/AC/run-1
my_bamtools=~/bin/bamtools/bin/bamtools
pop=GA

$my_bamtools merge -list ~/admixture_mapping/scripts/bam.$pop.list |\
~/bin/samtools-1.3.1/samtools sort - -T $pop.temp -O bam -o \
~/admixture_mapping/processed_data/aligned/AC/run-1/$pop.all.bam

