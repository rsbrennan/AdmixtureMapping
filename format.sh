#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o format-stdout-%j.txt
#SBATCH -e format-stderr-%j.txt
#SBATCH -J format

cd ~/admixture_mapping/variants/

#zcat ~/admixture_mapping/variants/all.filtered.vcf.gz | grep '^#' > header.all.txt
#grep '^chr*' ~/admixture_mapping/variants/all.chrom.vcf | cat header.all.txt - |\
#~/bin/vcftools/perl/vcf-sort -c | awk -v OFS="\t" '$1=$1'| \
#~/bin/vcftools/bin/vcftools --vcf - --remove-indv PC-369-001 --remove-indv PC-386-017 --recode --recode-INFO-all --stdout |\
#bgzip > ~/admixture_mapping/variants/all.chrom.tmp.vcf.gz

#tabix -f -p vcf ~/admixture_mapping/variants/all.chrom.tmp.vcf.gz

zcat ~/admixture_mapping/variants/all.filtered.vcf.gz | head -n 400 | grep '^#' | head -n 57 | tail -n 1 | cut -f 1-9 > ~/admixture_mapping/variants/col.name
paste col.name ~/admixture_mapping/scripts/poplists/ordered.labels > ~/admixture_mapping/variants/col.name.1
zcat ~/admixture_mapping/variants/all.filtered.vcf.gz | head -n 400 | grep '^#' | head -n 56 | cat - ~/admixture_mapping/variants/col.name.1  > target.header.vcf

rm ~/admixture_mapping/variants/col.name
rm ~/admixture_mapping/variants/col.name.1

#bgzip target header
bgzip -f ~/admixture_mapping/variants/target.header.vcf > ~/admixture_mapping/variants/target.header.vcf.gz
tabix -f -p vcf  ~/admixture_mapping/variants/target.header.vcf.gz

#reorder columns and make final vcf
~/bin/vcftools/perl/vcf-shuffle-cols -t ~/admixture_mapping/variants/target.header.vcf.gz \
~/admixture_mapping/variants/all.chrom.tmp.vcf.gz  |\
bgzip > ~/admixture_mapping/variants/all.chrom.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/all.chrom.vcf.gz
