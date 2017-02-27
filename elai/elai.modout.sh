#!/bin/bash -l

#make map file first

cd ~/admixture_mapping/analysis/elai/output/

rm snpinfo.mod.txt
touch snpinfo.mod.txt

for i in $(ls *.2.200.snpinfo.txt | awk -F'.' '{print $2}' | cut -c 4- | sort -n | uniq); do

	cat ~/admixture_mapping/variants/bimbam/chr${i}.PP.recode.pos.txt |\
	awk '{OFS="\t"; {print $1,$2,'${i}'}}' >> snpinfo.mod.txt

done

#combine ancestry

#rm AF.combined.ps21.txt
#rm BC.combined.ps21.txt
#touch AF.combined.ps21.txt
#touch BC.combined.ps21.txt

#for POP in AF BC; do
#	for i in $(ls *.2.200.snpinfo.txt | awk -F'.' '{print $2}' | cut -c 4- | sort -n | uniq); do

#		cat ${POP}.chr${i}.combined.txt >> ${POP}.all.combined.ps21.txt

#done
