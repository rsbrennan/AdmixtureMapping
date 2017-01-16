#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o toplink-stdout-%j.txt
#SBATCH -e toplink-stderr-%j.txt
#SBATCH -J toplink

# mod 2017-01-11

cd ~/admixture_mapping/variants/

zcat ~/admixture_mapping/variants/all.90.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - --plink --out all.90.chrom

#/home/rsbrenna/bin/plink --file AM-1-variants.filter --make-bed  --allow-extra-chr --out AM-1-variants.filter

#~/bin/vcftools/bin/vcftools --vcf AM-1-variants.filter.vcf --keep admixed.list --plink --out admixed


