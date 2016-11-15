#!/bin/bash -l

cd ~/admixture_mapping/analysis/elai/output/

for chrom in $(echo "chr1" "chr2" "chr3" "chr4"  "chr5" "chr6")

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
	}' ${chrom}.100.[0-9].ps21.txt | cut -f 2- -d " "  > ${chrom}.100.combined.ps21.txt
done

