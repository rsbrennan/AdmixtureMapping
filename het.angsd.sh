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
bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

N_SITES=`zcat ~/admixture_mapping/variants/angsd.mafs.gz | tail -n+2 | wc -l`

zcat AF.saf.gz > AF.saf
zcat PP.saf.gz > PP.saf
zcat PL.saf.gz > PL.saf
zcat TR.saf.gz > TR.saf
zcat PC.saf.gz > PC.saf
zcat HP.saf.gz > HP.saf
zcat BC.saf.gz > BC.saf
zcat GA.saf.gz > GA.saf
