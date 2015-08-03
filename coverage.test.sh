#!/bin/bash 
module load bedtools
cd /home/rsbrenna/admixture_mapping/aligned

genomeCoverageBed -ibam ~/admixture_mapping/aligned/PP-428-07.sort.rg.bam -g ~/reference/ScaffoldLengths.txt -bg -max 200
