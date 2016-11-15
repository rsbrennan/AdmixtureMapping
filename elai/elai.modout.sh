#!/bin/bash -l

#make map file first

cd ~/admixture_mapping/analysis/elai/output/

for i in $(ls *.2.snpinfo.txt | awk -F'.' '{print $1}' | cut -c 4- | sort -n | uniq); do

	cat ~/admixture_mapping/variants/bimbam/chr${i}.PP.recode.pos.txt | awk '{OFS="\t"; {print $1,$2,'${i}'}}' >> snpinfo.mod.txt

done

cat ~/admixture_mapping/variants/bimbam/chr1.PP.recode.pos.txt | awk '{OFS="\t"; {print $1,$2,"1"}}' | head


#combine ancestry

rm all.combined.ps21.txt
touch all.combined.ps21.txt

for i in $(ls *.2.snpinfo.txt | awk -F'.' '{print $1}' | cut -c 4- | sort -n | uniq); do

	paste all.combined.ps21.txt chr${i}.combined.txt >> all.combined.ps21.txt.1
	mv all.combined.ps21.txt.1 all.combined.ps21.txt

done
