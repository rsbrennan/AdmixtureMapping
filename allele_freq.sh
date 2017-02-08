#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o allele_freq-stdout-%j.txt
#SBATCH -e allele_freq-stderr-%j.txt
#SBATCH -J allele_freq


cd ~/admixture_mapping/analysis/neighbor/

for POP in PP PL AF GA HP BC PC TR; do
	zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
	sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
	~/bin/vcftools/bin/vcftools --vcf - \
	--keep ~/admixture_mapping/scripts/poplists/${POP}.pop \
	--freq \
	--out ${POP}

done
