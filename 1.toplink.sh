#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o toplink-stdout-%j.txt
#SBATCH -e toplink-stderr-%j.txt
#SBATCH -J toplink

# mod 2017-01-11

module load vcftools/0.1.13

cd ~/admixture_mapping/variants/

# make plink map so it can handle scaffolds

zcat ~/admixture_mapping/variants/cb.chrom.vcf.gz | grep -v '^#' | cut -f 1 | \
	sort | uniq > ~/admixture_mapping/variants/plink-chrom-map.1.txt

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz | grep -v '^#' | cut -f 1 | \
	cat - ~/admixture_mapping/variants/plink-chrom-map.1.txt | sort | \
	uniq > ~/admixture_mapping/variants/plink-chrom-map.2.txt

zcat ~/admixture_mapping/variants/ac.chrom.vcf.gz | grep -v '^#' | cut -f 1 | \
	cat - ~/admixture_mapping/variants/plink-chrom-map.2.txt | sort | \
	uniq > ~/admixture_mapping/variants/plink-chrom-map.3.txt

paste ~/admixture_mapping/variants/plink-chrom-map.3.txt ~/admixture_mapping/variants/plink-chrom-map.3.txt > ~/admixture_mapping/variants/plink-chrom-map.txt

rm ~/admixture_mapping/variants/plink-chrom-map.1.txt
rm ~/admixture_mapping/variants/plink-chrom-map.2.txt
rm ~/admixture_mapping/variants/plink-chrom-map.3.txt


#all indivs
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
vcftools --vcf - \
--plink \
--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
--out all.chrom

#cb only
zcat ~/admixture_mapping/variants/cb.chrom.vcf.gz  |\
vcftools --vcf - \
--plink \
--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
--out cb.chrom

#ac only
zcat ~/admixture_mapping/variants/ac.chrom.vcf.gz  |\
vcftools --vcf - \
--plink \
--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
--out ac.chrom
