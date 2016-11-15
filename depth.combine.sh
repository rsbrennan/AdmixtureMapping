#!/bin/bash -l
#SBATCH -p hi
#SBATCH --mem=20000
###### number of nodes
###### number of processors
#SBATCH --cpus-per-task=8

lib=BC



awk '{a[FNR]=a[FNR]?a[FNR]" "$5:$5}END{for(i=1;i<=length(a);i++)print a[i]}'\
 ~/admixture_mapping/summary_files/depth/AC/$lib\-* > $lib.depth.out

