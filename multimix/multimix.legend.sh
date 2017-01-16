#!/bin/bash -l

cd ~/admixture_mapping/variants/

echo "rs position a0 a1" > tmp.txt
zcat cb-all.70.chrom.vcf.gz | grep -v '^#' | cut -f 1,2,4,5 > out.tmp
cut out.tmp -f 2- |\
paste -d " " <(paste -d "." <(cut -f1 out.tmp) <(cut -f2 out.tmp)) - |\
cat tmp.txt - |\
sed 's/Chrom/chr/g' | sed -e "s/[[:space:]]\+/ /g" \
> ~/admixture_mapping/multimix/legend_files/all.legend.txt

cd ~/admixture_mapping/multimix/legend_files/

for i in $(cat all.legend.txt | cut -f 1 | cut -f 1 -d "." | uniq | grep -v '^rs')
do

	grep -P  "^${i}\." all.legend.txt |\
	cat ~/admixture_mapping/variants/tmp.txt - > ${i}.legend

done

#rm all.legend.txt
