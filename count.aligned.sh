#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o count.aligned-stdout-%j.txt
#SBATCH -e count.aligned-stderr-%j.txt
#SBATCH -J count.aligned

# mod 2017-01-11

cd ~/admixture_mapping/processed_data/aligned/AC-combined/

for i in $(ls *.bam | cut -c -10 | uniq )

do {
	ONE=$(samtools view -h -F 1024 ${i}.combined.bam | samtools view -S -F 4 - | wc -l) #mapped reads
	TWO=$(samtools view -f 4 ${i}.combined.bam | wc -l) #unmapped reads
	THREE=$(samtools view -f 1024 ${i}.combined.bam | wc -l) #pcr duplicates
	FOUR=$(samtools view  ${i}.combined.bam | wc -l) #total
	FIVE=$(samtools view -F 3332 ${i}.combined.bam | wc -l)
	echo ${i},$ONE,$TWO,$THREE,$FOUR,$FIVE

  } >> ~/admixture_mapping/summary_files/count.aligned.combined-AC.txt


done
