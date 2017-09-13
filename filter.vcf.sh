#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o filt-stdout-%j.txt
#SBATCH -e filt-stderr-%j.txt
#SBATCH -J filt

# mod 2017-01-11

module load vcftools/0.1.13

cd ~/admixture_mapping/variants/

#filter all individuals

vcftools --gzvcf ~/admixture_mapping/variants/all.scaff.vcf.gz \
--remove-indv AF-634-141 \
--remove-indv AF-635-142 \
--remove-indv AF-636-143 \
--remove-indv AF-637-144 \
--remove-indv AF-638-145 \
--remove-indv AF-639-146 \
--remove-indv AF-640-147 \
--remove-indv AF-641-148 \
--remove-indv AF-506-244 \
--remove-indv BC-132-088 \
--recode --recode-INFO-all --maf 0.05 \
--minQ 20 --minGQ 30 \
--min-alleles 2 --max-alleles 2 \
--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/all.filtered.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/all.filtered.vcf.gz

#filter cb only

#vcftools --gzvcf ~/admixture_mapping/variants/all.scaff.vcf.gz \
#--keep /home/rsbrenna/admixture_mapping/scripts/poplists/CB.indivs \
#--remove-indv AF-634-141 \
#--remove-indv AF-635-142 \
#--remove-indv AF-636-143 \
#--remove-indv AF-637-144 \
#--remove-indv AF-638-145 \
#--remove-indv AF-639-146 \
#--remove-indv AF-640-147 \
#--remove-indv AF-641-148 \
#--remove-indv AF-506-244 \
#--remove-indv BC-132-088 \
#--recode --recode-INFO-all --maf 0.05 \
#--minQ 20 --minGQ 30 \
#--min-alleles 2 --max-alleles 2 \
#--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/cb.filtered.vcf.gz

#tabix -p vcf ~/admixture_mapping/variants/cb.filtered.vcf.gz


#filter ac only

vcftools --gzvcf ~/admixture_mapping/variants/all.scaff.vcf.gz \
--keep /home/rsbrenna/admixture_mapping/scripts/poplists/AC.indivs \
--remove-indv BC-132-088 \
--recode --recode-INFO-all --maf 0.01 \
--minQ 20 --minGQ 30 \
--min-alleles 2 --max-alleles 2 \
--max-missing 0.3 \
--remove-indels --stdout | bgzip > ~/admixture_mapping/variants/ac.filtered.vcf.gz

tabix -p vcf ~/admixture_mapping/variants/ac.filtered.vcf.gz
