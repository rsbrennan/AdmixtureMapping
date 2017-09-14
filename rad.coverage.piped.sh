#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o rad.coverage-stdout-%j.txt
#SBATCH -e rad.coverage-stderr-%j.txt
#SBATCH -J rad.coverage

cd ~/admixture_mapping/processed_data/aligned/AC-combined
my_bamtools=~/bin/bamtools/bin/bamtools
pop=TR

$my_bamtools merge -list ~/admixture_mapping/scripts/poplists/bam.$pop.list |\
~/bin/samtools-1.3.1/samtools sort - -T $pop.temp -O bam |\
~/bin/samtools-1.3.1/samtools view -b -h -F 0x0004 -F 0x0400 - | \
bedtools coverage -abam stdin \
-b ~/admixture_mapping/scripts/SbfI_List.bed -d \
> ~/admixture_mapping/summary_files/${pop}.bam.hist.all.txt
