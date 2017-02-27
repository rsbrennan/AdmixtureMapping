#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o bayescan-stdout-%j.txt
#SBATCH -e bayescan-stderr-%j.txt
#SBATCH -J bayescan

#PP.PL
#TR.GA
#PC.HP

POP=PC.HP

~/bin/BayeScan2.1/source/bayescan_2.1 ~/admixture_mapping/variants/bayescan/${POP}.bscn -od /home/rsbrenna/admixture_mapping/analysis/bayescan -o ${POP}.1k -n 5000 -thin 10 -nbp 20 -pilot 5000 -burn 50000 -pr_odds 1000




#~/bin/BayeScan2.1/source/bayescan_2.1\
# ~/admixture_mapping/variants/bayescan/${POP}.bscn\ #allele freq file
 #-od /home/rsbrenna/admixture_mapping/results/bayescan\ #out directory
 #-o ${POP}\ #output file name
 #-n 5000\ # number of output iterations, default =10
 #-thin 10\ #thinning interval size, default =10
 #-nbp 20\ # Number of pilot runs, default is 20
 #-pilot 5000\ # Length of pilot runs, default is 5000
 #-burn 50000\ #Burn-in length, default is 50000
 #-pr_odds 10000 #Prior odds for the neutral model, default is 10. use 10k, from lotterhos and whitlock 2014 mol ecol.
