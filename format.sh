#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o format-stdout-%j.txt
#SBATCH -e format-stderr-%j.txt
#SBATCH -J format

cd ~/admixture_mapping/variants/

zcat ~/admixture_mapping/variants/all.filtered.vcf.gz | grep '^#' > header.all.txt
grep '^chr*' ~/admixture_mapping/variants/all.chrom.vcf | cat header.all.txt - |\
~/bin/vcftools/perl/vcf-sort -c | awk -v OFS="\t" '$1=$1'| bgzip > ~/admixture_mapping/variants/all.chrom.tmp.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/all.chrom.tmp.vcf.gz

~/bin/vcftools/perl/vcf-shuffle-cols ~/admixture_mapping/variants/target.header \
~/admixture_mapping/variants/all.chrom.tmp.vcf.gz  > \
~/admixture_mapping/variants/all.chrom.vcf.gz
