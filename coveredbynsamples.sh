#!/bin/bash -l

#SBATCH --mem=26000

java -jar ~/bin/GenomeAnalysisTK.jar \
	-T CoveredByNSamplesSites \
	-V ~/admixture_mapping/variants/cb-all.filtered.vcf.gz \
	-R ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa\
	-percentage .70 \
	-minCov 8 \
	-out coveredbyN.txt
