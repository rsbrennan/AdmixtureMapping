#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o sort-stdout-%j.txt
#SBATCH -e sort-stderr-%j.txt
#SBATCH -J sort

#for chr converted bam files

lib=CB-combined

dir=~/admixture_mapping/processed_data/aligned/$lib/
my_samtools=~/bin/samtools-1.3.1/samtools

cd $dir

#sort bam file
for indiv in $(find $dir -name "*.chr.bam" | cut -f 8 -d "/" | cut -f 1 -d ".")

do {

	$my_samtools sort ${indiv}.chr.bam -T /scratch/${indiv}.temp -O bam -o ${indiv}.sort.bam

  }
done

#index bam file
for i in $(ls *sort.bam)

do {

	samtools index ${i}

  }
done
