#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobed-stdout-%j.txt
#SBATCH -e tobed-stderr-%j.txt
#SBATCH -J tobed

# mod 2017-01-11

cd ~/admixture_mapping/variants/

sed -i 's/^/x/' all.chrom.map

#think markers for ld
~/bin/plink --file all.chrom --indep 50 5 2 \
--allow-extra-chr \
--keep ~/admixture_mapping/scripts/subsamp.list \
-out chrom.subsamp.plink.ld

# output thinned ped

~/bin/plink --file all.chrom --extract chrom.subsamp.plink.ld.prune.in --recode --allow-extra-chr \
--keep ~/admixture_mapping/scripts/subsamp.list \
--out chrom.subsamp

# output thinned bed

~/bin/plink --file all.chrom --extract chrom.subsamp.plink.ld.prune.in --make-bed --allow-extra-chr \
--keep ~/admixture_mapping/scripts/subsamp.list \
--out chrom.subsamp
