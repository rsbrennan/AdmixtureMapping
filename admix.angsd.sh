#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o admix.angsd-stdout-%j.txt
#SBATCH -e admix.angsd-stderr-%j.txt
#SBATCH -J admix.angsd

NGSTOOLS=~/bin/ngsTools
ANGSD=~/bin/angsd/
NGSADMIX=~/bin/NGSadmix
SAMTOOLS=~/bin/samtools-1.3.1/samtools
FASTME=/data/data/Software/fastme-2.1.4/binaries/fastme-2.1.4-linux64
bam_list=~/admixture_mapping/scripts/bam.all.list
REF=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa

K=3

$NGSADMIX -likes ~/admixture_mapping/variants/angsd.beagle.gz -K $K \
-outfiles ~/admixture_mapping/variants/admix.3.angsd -P 8 -minMaf 0.01 -minInd 400

K=2

$NGSADMIX -likes ~/admixture_mapping/variants/angsd.beagle.gz -K $K \
-outfiles ~/admixture_mapping/variants/admix.2.angsd -P 8 -minMaf 0.01 -minInd 400
