#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o count.demulti-stdout-%j.txt
#SBATCH -e count.demulti-stderr-%j.txt
#SBATCH -J count.demulti

# mod 2017-01-11

lane=lane3
lib=AC-5

cd ~/admixture_mapping/processed_data/demultiplex/AC/run-2/${lane}/${lib}

for i in $(ls *RA.fastq | cut -c -10)

do {
FORWARD=$(cat ${i}_RA.fastq | wc -l) #forward reads
REVERSE=$(cat ${i}_RB.fastq | wc -l) #reverse reads
echo ${i},${lane},$FORWARD,$REVERSE

  } >> ~/admixture_mapping/summary_files/count.demultiplex.${lane}.${lib}.txt

done
