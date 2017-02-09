#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o toplinkgwas-stdout-%j.txt
#SBATCH -e toplinkgwas-stderr-%j.txt
#SBATCH -J toplinkgwas

cd ~/admixture_mapping/variants/

#bgzip -c AF-chrom.vcf > AF-chrom.vcf.gz
#bgzip -c BC-chrom.vcf > BC-chrom.vcf.gz
#tabix -p vcf AF-chrom.vcf.gz
#tabix -p vcf BC-chrom.vcf.gz

cat AF.BC.recode.vcf |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - --plink --out AF.BC


~/bin/plink --file AF.BC --make-bed --out AF.BC


