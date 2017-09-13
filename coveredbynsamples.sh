#!/bin/bash -l

#SBATCH --mem=26000
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o coveredbyN-stdout-%j.txt
#SBATCH -e coveredbyN-stderr-%j.txt
#SBATCH -J coveredbyN

# mod 2017-01-11

COV=8
POP=all


for percent in 0.7 0.8 0.9; do

	java -jar ~/bin/GenomeAnalysisTK.jar \
	-T CoveredByNSamplesSites \
	-V ~/admixture_mapping/variants/${POP}.filtered.vcf.gz \
	-R ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa\
	-percentage $percent \
	-minCov $COV \
	-out ~/admixture_mapping/results/coveredbyN.${POP}.$percent.$COV.txt
done
