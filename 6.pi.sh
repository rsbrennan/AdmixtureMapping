#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o pi-stdout-%j.txt
#SBATCH -e pi-stderr-%j.txt
#SBATCH -J pi

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
#bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

module load gcc/6.3.1

~/bin/stacks-1.46/populations -b 1 \
	--in_vcf ~/admixture_mapping/variants/cb.chrom.vcf.gz \
	--out_path ~/admixture_mapping/analysis/pi/ \
	--popmap ~/admixture_mapping/scripts/poplists/stacks_pop.parent.list  \
	-r 0.5 \
	-t 6

#to enable kernal smoothing, add -k option

~/bin/stacks-1.46/populations -b 1 --in_vcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
	--out_path ~/admixture_mapping/analysis/pi/ \
	--popmap ~/admixture_mapping/scripts/poplists/stacks_pop.parent.list  \
	-r 0.5 \
	-t 6
