#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o admixture-stdout-%j.txt
#SBATCH -e admixture-stderr-%j.txt
#SBATCH -J admixture

# mod 2017-01-11

cd ~/admixture_mapping/results/

POP=CB

sed -i 's/x//g' ~/admixture_mapping/variants/chrom.${POP}.all.bim

for K in 2 3;
	do ~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/chrom.${POP}.all.bed $K | tee log${K}.out; 
done

POP=AC

sed -i 's/x//g' ~/admixture_mapping/variants/chrom.${POP}.all.bim

for K in 2 3;
	do ~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/chrom.${POP}.all.bed $K | tee log${K}.out; 
done

POP=N_S.remove.subsamp

sed -i 's/x//g' ~/admixture_mapping/variants/${POP}.bim

for K in 2 3 4 5 6;
	do ~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/${POP}.bed $K | tee log${K}.out; 
done

