#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o liftover-stdout-%j.txt
#SBATCH -e liftover-stderr-%j.txt
#SBATCH -J liftover

module load java/1.8

#this picard is version 2.9.4

cd ~/admixture_mapping/variants/

java -Xms56G -Xmx60G -jar ~/bin/picard.jar LiftoverVcf \
     I=cb.final.vcf.gz \
     O=cb.chrom.vcf \
     CHAIN=/home/jmiller1/bin/code/ALLMAPS_OUT/MF.Map/unsplit_merge.chain \
     REJECT=rejected_cb.vcf \
     R=~/reference/chr_JM_2017-06-21.fasta

java -Xms56G -Xmx60G -jar ~/bin/picard.jar LiftoverVcf \
     I=all.final.vcf.gz \
     O=all.chrom.vcf \
     CHAIN=/home/jmiller1/bin/code/ALLMAPS_OUT/MF.Map/unsplit_merge.chain \
     REJECT=rejected_all.vcf \
     R=~/reference/chr_JM_2017-06-21.fasta


