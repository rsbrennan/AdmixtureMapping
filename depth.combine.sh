#!/bin/bash -l
#SBATCH -p hi
#SBATCH --mem=20000
###### number of nodes
###### number of processors
#SBATCH --cpus-per-task=8

awk '{a[FNR]=a[FNR]?a[FNR]" "$5:$5}END{for(i=1;i<=length(a);i++)print a[i]}' AF* > AF.depth.out

