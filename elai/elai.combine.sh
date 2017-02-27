#!/bin/bash -l

cd ~/admixture_mapping/analysis/elai/output/


#Pops are AF or BC
POP=BC

for chrom in $(ls *.log.txt | awk -F'.' '{print $2}' | sort | uniq)

do

awk 'FNR == 1{ nfiles++; ncols = NF }
	{ for (i = 1; i <= NF; i++) sum[FNR,i] += $i
	if (FNR > maxnr) maxnr = FNR
	}
	END {
		for (line = 1; line <= maxnr; line++)
		{
       			for (col = 1; col <= ncols; col++)
               			printf " %f", sum[line,col]/nfiles;
       			printf "\n"
       		}
	}' ${POP}.${chrom}.[0-9].[0-9]00.ps21.txt > ${POP}.${chrom}.combined.txt
done


#combine the two populations

for chrom in $(ls AF.chr*.combined.txt| awk -F'.' '{print $2}' | sort | uniq)

do

	cat AF.${chrom}.combined.txt BC.${chrom}.combined.txt >  all.${chrom}.combined.txt

done
