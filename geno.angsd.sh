#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o geno.angsd-stdout-%j.txt
#SBATCH -e geno.angsd-stderr-%j.txt
#SBATCH -J geno.angsd

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
FASTME=/data/data/Software/fastme-2.1.4/binaries/fastme-2.1.4-linux64
bam_list=~/admixture_mapping/scripts/bam.noadmix.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

#use gatk likelihood method

# remove reads with low quality and/or with multiple hits, a

$ANGSD/angsd -P 8 -b $bam_list -ref $REF -out ~/admixture_mapping/variants/angsd \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 25 -minQ 30 -minInd 150 -doCounts 1 \
	-setMinDepth 1500 -setMaxDepth 60000 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 \
        -doGeno 32 -doPost 1 \
	-doGlf 2 \
	-rf ~/admixture_mapping/scripts/angsd.scaff

