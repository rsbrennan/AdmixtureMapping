#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o admixture-stdout-%j.txt
#SBATCH -e admixture-stderr-%j.txt
#SBATCH -J admixture

# mod 2017-01-11

cd ~/admixture_mapping/results/

for i in cb all;
do

        awk 'BEGIN { OFS= "\t"} { sub("chr24x", "24", $1)}1' ~/admixture_mapping/variants/${i}.thinned.bim \
        > ~/admixture_mapping/variants/${i}.thinned.bim.1
	mv ~/admixture_mapping/variants/${i}.thinned.bim.1 ~/admixture_mapping/variants/${i}.thinned.bim

done

for i in cb ac; do

	cat ~/admixture_mapping/variants/${i}.thinned.bim | \
	cut -f 1 | sort | uniq | sort -V > ~/admixture_mapping/scripts/${i}.scaffold.list

	rm ~/admixture_mapping/scripts/${i}.scaffold.num

	touch ~/admixture_mapping/scripts/${i}.scaffold.num

	num=$(cat ~/admixture_mapping/scripts/${i}.scaffold.list | wc -l)

	for scaf in $(seq 1 $num); do

		echo $scaf >> ~/admixture_mapping/scripts/${i}.scaffold.num

	done

	paste ~/admixture_mapping/scripts/${i}.scaffold.list ~/admixture_mapping/scripts/${i}.scaffold.num \
	> ~/admixture_mapping/scripts/${i}.scaffold.table


	awk 'NR==1 { next } FNR==NR { a[$1]=$2; next } $1 in a { $1=a[$1] }1' OFS='\t' \
	~/admixture_mapping/scripts/${i}.scaffold.table ~/admixture_mapping/variants/${i}.thinned.bim  \
	> ~/admixture_mapping/variants/${i}.thinned.bim.1

	mv ~/admixture_mapping/variants/${i}.thinned.bim.1 ~/admixture_mapping/variants/${i}.thinned.bim

done

#sed -i 's/x//g' ~/admixture_mapping/variants/chrom.${POP}.all.bim

for POP in cb ac;
do

	for K in 2 3;
	do

	~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/${POP}.thinned.bed $K | tee log${K}.out;

	done
done


