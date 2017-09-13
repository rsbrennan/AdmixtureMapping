#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o format-stdout-%j.txt
#SBATCH -e format-stderr-%j.txt
#SBATCH -J format

cd ~/admixture_mapping/variants/

for POP in ac; do

#make header file
zcat ~/admixture_mapping/variants/${POP}.filtered.vcf.gz | grep '^#' > header.${POP}.txt

#add header to vcf, also sort vcf
#cat header.${POP}.txt ~/admixture_mapping/variants/${POP}.chrom.vcf |\
#~/bin/vcftools/perl/vcf-sort -c | awk -v OFS="\t" '$1=$1'| \
#~/bin/vcftools/bin/vcftools --vcf - --remove-indv PC-369-001 --remove-indv PC-386-017 --remove-indv PC-393-024 --remove-indv BC-329-279 \
#--recode --recode-INFO-all --stdout |\
#bgzip > ~/admixture_mapping/variants/${POP}.chrom.tmp.vcf.gz

#make target header
zcat ~/admixture_mapping/variants/${POP}.filtered.vcf.gz | head -n 400 | grep '^#' | head -n 57 | tail -n 1 | \
	cut -f 1-9 > ~/admixture_mapping/variants/col.name
paste col.name ~/admixture_mapping/scripts/poplists/${POP}.ordered.labels > ~/admixture_mapping/variants/col.name.1

zcat ~/admixture_mapping/variants/${POP}.filtered.vcf.gz | head -n 400 | grep '^#' | head -n 56 | \
cat - ~/admixture_mapping/variants/col.name.1  > target.header.vcf

rm ~/admixture_mapping/variants/col.name
rm ~/admixture_mapping/variants/col.name.1

#bgzip target header
bgzip -f ~/admixture_mapping/variants/target.header.vcf > ~/admixture_mapping/variants/target.header.vcf.gz
tabix -f -p vcf  ~/admixture_mapping/variants/target.header.vcf.gz

#reorder columns and make final vcf- want to reorder so order is consistent across everything.
~/bin/vcftools/perl/vcf-shuffle-cols -t ~/admixture_mapping/variants/target.header.vcf.gz \
~/admixture_mapping/variants/${POP}.chrom.tmp.vcf.gz  |\
bgzip > ~/admixture_mapping/variants/${POP}.chrom.vcf.gz

# we ahve some weird insertion of tabs (from a step above) in the header. I don't want this. 
# reconfigure with spaces instead.

zcat ~/admixture_mapping/variants/${POP}.chrom.vcf.gz | grep '^##' | sed 's/\t/ /g' > tmp.header
zcat ~/admixture_mapping/variants/${POP}.chrom.vcf.gz | grep -v '^##' | cat tmp.header - | bgzip > tmp.vcf.gz

mv tmp.vcf.gz ~/admixture_mapping/variants/${POP}.chrom.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/${POP}.chrom.vcf.gz

rm tmp.header

#rm ${POP}.chrom.tmp.vcf.gz

done

