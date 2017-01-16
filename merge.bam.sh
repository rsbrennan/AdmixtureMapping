#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o merge.bam-stdout-%j.txt
#SBATCH -e merge.bam-stderr-%j.txt
#SBATCH -J merge.bam

# mod 2017-01-11

lib=AC-5

cd ~/admixture_mapping/processed_data/aligned/AC/run-1/${lib}/
my_bamtools=~/bin/bamtools/bin/bamtools


for i in $(ls *.bam | cut -c -10 )

do {
$my_bamtools merge \
-in ~/admixture_mapping/processed_data/aligned/AC/run-1/${lib}/$i.bam \
-in ~/admixture_mapping/processed_data/aligned/AC/run-2/${lib}/$i.bam |\
~/bin/samtools-1.3.1/samtools sort - -T $i.temp -O bam -o \
~/admixture_mapping/processed_data/aligned/AC-combined/$i.combined.bam
  }

done
