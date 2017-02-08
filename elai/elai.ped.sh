#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o elai_ped-stdout-%j.txt
#SBATCH -e elai_ped-stderr-%j.txt
#SBATCH -J elai_ped

#
#
#

cd ~/admixture_mapping/variants/

POP=PP

for chrom in {1..24}; do
	sed 's/chr//g' ${POP}-chrom.vcf | \
	~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
	--out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done

POP=AF

for chrom in {1..24}; do
        sed 's/chr//g' ${POP}-chrom.vcf | \
        ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
        --out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done

POP=PL

for chrom in {1..24}; do
        sed 's/chr//g' ${POP}-chrom.vcf | \
        ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
        --out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done

POP=PC

for chrom in {1..24}; do
        sed 's/chr//g' ${POP}-chrom.vcf | \
        ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
        --out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done

POP=BC

for chrom in {1..24}; do
        sed 's/chr//g' ${POP}-chrom.vcf | \
        ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
        --out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done

POP=HP

for chrom in {1..24}; do
        sed 's/chr//g' ${POP}-chrom.vcf | \
        ~/bin/vcftools/bin/vcftools --vcf - --plink --chr ${chrom} \
        --out ~/admixture_mapping/variants/plink/chr${chrom}.${POP}
done
