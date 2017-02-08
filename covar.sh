#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o covar-stdout-%j.txt
#SBATCH -e covar-stderr-%j.txt
#SBATCH -J covar

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
FASTME=/data/data/Software/fastme-2.1.4/binaries/fastme-2.1.4-linux64
bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

cd ~/admixture_mapping/variants/

#unzip results
gunzip ~/admixture_mapping/variants/angsd.geno.gz

N_SITES=`zcat ~/admixture_mapping/variants/angsd.mafs.gz | tail -n+2 | wc -l`

$NGSTOOLS/ngsPopGen/ngsCovar -probfile ~/admixture_mapping/variants/angsd.geno \
-outfile ~/admixture_mapping/variants/pop.covar -nind 817 \
-nsites $N_SITES -call 0 -norm 0
