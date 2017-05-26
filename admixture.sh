#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o admixture-stdout-%j.txt
#SBATCH -e admixture-stderr-%j.txt
#SBATCH -J admixture

# mod 2017-01-11

cd ~/admixture_mapping/results/

for i in all N_S.remove N_S.remove.subsamp CB AC noadmix all.subsamp;
do

        awk 'BEGIN { OFS= "\t"} { sub("chr24x", "24", $1)}1' ~/admixture_mapping/variants/${i}.thinned.bim \
        > ~/admixture_mapping/variants/${i}.thinned.bim.1
	mv ~/admixture_mapping/variants/${i}.thinned.bim.1 ~/admixture_mapping/variants/${i}.thinned.bim

done

cat ~/admixture_mapping/variants/*.bim | \
cut -f 1 | sort | uniq | sort -V > ~/admixture_mapping/scripts/scaffold.list

rm ~/admixture_mapping/scripts/scaffold.num

touch ~/admixture_mapping/scripts/scaffold.num

for i in {1..1191}
do
 echo $i >> ~/admixture_mapping/scripts/scaffold.num
done

paste ~/admixture_mapping/scripts/scaffold.list ~/admixture_mapping/scripts/scaffold.num > ~/admixture_mapping/scripts/scaffold.table

for i in all N_S.remove N_S.remove.subsamp CB AC noadmix all.subsamp;
do

	awk 'NR==1 { next } FNR==NR { a[$1]=$2; next } $1 in a { $1=a[$1] }1' OFS='\t' \
	~/admixture_mapping/scripts/scaffold.table ~/admixture_mapping/variants/${i}.thinned.bim  \
	> ~/admixture_mapping/variants/${i}.thinned.bim.1

	mv ~/admixture_mapping/variants/${i}.thinned.bim.1 ~/admixture_mapping/variants/${i}.thinned.bim

done

#sed -i 's/x//g' ~/admixture_mapping/variants/chrom.${POP}.all.bim

for POP in all N_S.remove N_S.remove.subsamp CB AC noadmix all.subsamp;
do

	for K in 2 3 4 5 6;
	do

	~/bin/admixture_linux-1.23/admixture --cv ~/admixture_mapping/variants/${POP}.thinned.bed $K | tee log${K}.out;

	done
done

