#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o merge.fastq-stdout-%j.txt
#SBATCH -e merge.fastq-stderr-%j.txt
#SBATCH -J merge.fastq

# mod 2017-01-11

for lib in $(ls ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane2/);do

	for samp in $(ls ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane2/${lib}/*_RA.fastq);do
		base=$(basename $samp )
		echo $base
		name=$(echo $base | cut -f 1 -d "_")
		echo $name
		cat ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane2/${lib}/${name}_RA.fastq \
		~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane3/${lib}/${name}_RA.fastq \
		~/admixture_mapping/processed_data/demultiplex/AC/run-1/${lib}/${name}_RA.fastq |\
		gzip >\
		~/admixture_mapping/processed_data/demultiplex/AC/combined/${lib}/${name}_RA.fastq.gz

		cat ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane2/${lib}/${name}_RB.fastq \
                ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane3/${lib}/${name}_RB.fastq \
		~/admixture_mapping/processed_data/demultiplex/AC/run-1/${lib}/${name}_RB.fastq|\
		gzip >\
                ~/admixture_mapping/processed_data/demultiplex/AC/combined/${lib}/${name}_RB.fastq.gz
		done
done
