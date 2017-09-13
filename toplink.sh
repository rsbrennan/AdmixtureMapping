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

#all indivs
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
vcftools --vcf - \
--plink \
--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
--out all.chrom

for i in N_S.remove N_S.remove.subsamp CB AC noadmix all.subsamp;
do

	zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
	vcftools --vcf - \
	--keep ~/admixture_mapping/scripts/poplists/${i}.keep \
	--plink \
	--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
 	--out ${i}

done
