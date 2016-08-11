#!/bin/bash -l

zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(PL-\S+))" |\
cut -f 2 >  ~/admixture_mapping/variants/PP.list

zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(PL-\S+))" |\
cut -f 2 >  ~/admixture_mapping/variants/PL.list

for chrom in $(zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | grep -v '^#' | cut -f 1 | uniq); do
        zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
        ~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/PP.list |\
        grep "${chrom}" |\
        cut -f 10- |\
        sed 's/\([^\t]\{3\}\)[^\t]*/\1/g' |\
        sed -e 's/0\/0/0/g' |\
        sed 's/0\/1/1/g' |\
        sed 's/1\/1/2/g' |\
        sed 's/\.\:\./9/g' \
        > ~/admixture_mapping/multimix/data/haplotypes/MDPP/${chrom}.genos

done

cd ~/admixture_mapping/multimix/data/haplotypes/MDPP/

rename s/Chrom/chr/ Chrom*

for chrom in $(zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | grep -v '^#' | cut -f 1 | uniq); do
	zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
	~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/PL.list |\
	grep "${chrom}" |\
	cut -f 10- |\
	sed 's/\([^\t]\{3\}\)[^\t]*/\1/g' |\
	sed -e 's/0\/0/0/g' |\
	sed 's/0\/1/1/g' |\
	sed 's/1\/1/2/g' |\
	sed 's/\.\:\./9/g' \
	> ~/admixture_mapping/multimix/data/haplotypes/MDPL/${chrom}.genos

done

cd ~/admixture_mapping/multimix/data/haplotypes/MDPL/

rename s/Chrom/chr/ Chrom*
