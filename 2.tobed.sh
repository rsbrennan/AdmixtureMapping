#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobed-stdout-%j.txt
#SBATCH -e tobed-stderr-%j.txt
#SBATCH -J tobed

# mod 2017-01-11

cd ~/admixture_mapping/variants/

	awk '{ sub("^chr24$", "chr24x", $1)}1' \
	~/admixture_mapping/variants/cb.chrom.map \
	> ~/admixture_mapping/variants/cb.chrom.map.1

	mv ~/admixture_mapping/variants/cb.chrom.map.1 \
	~/admixture_mapping/variants/cb.chrom.map

        awk '{ sub("^chr24$", "chr24x", $1)}1' \
        ~/admixture_mapping/variants/cb.all.chrom.map \
        > ~/admixture_mapping/variants/cb.all.chrom.map.1

        mv ~/admixture_mapping/variants/cb.all.chrom.map.1 \
        ~/admixture_mapping/variants/cb.all.chrom.map


for POP in cb ac;
do
	#think markers for ld
	~/bin/plink --file ${POP}.chrom --indep 50 5 2 \
	--allow-extra-chr \
	-out ${POP}.plink.ld

	# output thinned ped
	~/bin/plink --file ${POP}.chrom \
	--extract ${POP}.plink.ld.prune.in --recode --allow-extra-chr \
	--out ${POP}.thinned

	# output thinned bed
	~/bin/plink --file ${POP}.chrom \
	-extract ${POP}.plink.ld.prune.in --make-bed --allow-extra-chr \
	--out ${POP}.thinned

done

#generate population files
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'AF' > ~/admixture_mapping/scripts/poplists/AF.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'BC' > ~/admixture_mapping/scripts/poplists/BC.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'PP' > ~/admixture_mapping/scripts/poplists/PP.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'PL' > ~/admixture_mapping/scripts/poplists/PL.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'HP' > ~/admixture_mapping/scripts/poplists/HP.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'PC' > ~/admixture_mapping/scripts/poplists/PC.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'TR' > ~/admixture_mapping/scripts/poplists/TR.indivs
cut -f 1  ~/admixture_mapping/variants/all.chrom.ped | grep 'GA' > ~/admixture_mapping/scripts/poplists/GA.indivs
