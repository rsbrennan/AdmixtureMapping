#!/bin/bash -l

zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(AF-\S+))" |\
cut -f 2 >  ~/admixture_mapping/variants/AF.list

for chrom in $(zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | grep -v '^#' | cut -f 1 | uniq); do
	zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
	~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/AF.list |\
	sed -e "s/[[:space:]]\+/ /g" |\
	grep -w "$chrom" |\
	cut -f 10- -d " "|\
	sed 's/\([^ ]\{3\}\)[^ ]*/\1/g' |\
	sed 's/0\/0/0 0 1/g' |\
	sed 's/0\/1/0 1 0/g' |\
	sed 's/1\/1/1 0 0/g' |\
	sed 's/\.\:\./9 9 9/g' \
	> ~/admixture_mapping/multimix/data/Samples/genos/${chrom}.genos

done

cd ~/admixture_mapping/multimix/data/Samples/genos/

rename s/Chrom/chr/ Chrom*


for chrom in $(ls chr*); do
	tail -n +2 ~/admixture_mapping/multimix/legend_files/${chrom}.legend |\
	paste - ~/admixture_mapping/multimix/data/Samples/genos/${chrom}.genos |\
	sed -e "s/[[:space:]]\+/ /g" \
	> ~/admixture_mapping/multimix//data/Samples/genos/${chrom}.1.genos
done
