#!/bin/bash -l

cd ~/admixture_mapping/analysis/elai/output/

for chrom in $(ls *.log.txt | awk -F'.' '{print $1}' | sort | uniq)

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
	}' ${chrom}.[0-9].ps21.txt | cut -f 2- -d " "  > ${chrom}.combined.txt
done

