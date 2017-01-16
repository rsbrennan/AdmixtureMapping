#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o var.summ-stdout-%j.txt
#SBATCH -e var.summ-stderr-%j.txt
#SBATCH -J var.summ

# mod 2017-01-11

zcat ~/admixture_mapping/variants/all.filtered.vcf.gz |\
~/bin/vcftools/bin/vcf-annotate --fill-type |\
grep -oP "TYPE=\w+" | sort | uniq -c
