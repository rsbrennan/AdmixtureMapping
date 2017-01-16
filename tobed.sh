#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobed-stdout-%j.txt
#SBATCH -e tobed-stderr-%j.txt
#SBATCH -J tobed

# mod 2017-01-11

cd ~/admixture_mapping/variants/

sed -i 's/^/x/' all.90.chrom.map

#think markers for ld
~/bin/plink --file all.90.chrom --indep 50 5 1.7 --mind 0.1 --geno 0.05 \
--maf 0.05 \
--allow-extra-chr \
--keep ~/admixture_mapping/variants/subsamp.list \
-out all.90.chrom.plink.ld

# output thinned ped

~/bin/plink --file all.90.chrom --extract all.90.chrom.plink.ld.prune.in --recode --allow-extra-chr \
--keep ~/admixture_mapping/variants/subsamp.list \
--out subsamp.chrom

# output thinned bed

~/bin/plink --file all.90.chrom --extract all.90.chrom.plink.ld.prune.in --make-bed --allow-extra-chr \
--keep ~/admixture_mapping/variants/subsamp.list \
--out subsamp.chrom
