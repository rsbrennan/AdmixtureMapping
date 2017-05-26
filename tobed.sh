#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobed-stdout-%j.txt
#SBATCH -e tobed-stderr-%j.txt
#SBATCH -J tobed

# mod 2017-01-11

cd ~/admixture_mapping/variants/

	awk '{ sub("^chr24$", "chr24x", $1)}1' ~/admixture_mapping/variants/all.chrom.map \
	> ~/admixture_mapping/variants/all.chrom.map.1

	mv ~/admixture_mapping/variants/all.chrom.map.1 ~/admixture_mapping/variants/all.chrom.map


for POP in N_S.remove N_S.remove.subsamp CB AC noadmix all.subsamp;
do
	#think markers for ld
	~/bin/plink --file all.chrom --indep 50 5 2 \
	--allow-extra-chr \
	--keep ~/admixture_mapping/scripts/poplists/${POP}.keep \
	-out ${POP}.plink.ld

	# output thinned ped
	~/bin/plink --file all.chrom --extract ${POP}.plink.ld.prune.in --recode --allow-extra-chr \
	--keep ~/admixture_mapping/scripts/poplists/${POP}.keep \
	--out ${POP}.thinned

	# output thinned bed
	~/bin/plink --file all.chrom --extract ${POP}.plink.ld.prune.in --make-bed --allow-extra-chr \
	--keep ~/admixture_mapping/scripts/poplists/${POP}.keep \
	--out ${POP}.thinned

done

#all indivs

        #think markers for ld
        ~/bin/plink --file all.chrom --indep 50 5 2 \
        --allow-extra-chr \
        -out all.plink.ld

        # output thinned ped
        ~/bin/plink --file all.chrom --extract all.plink.ld.prune.in --recode --allow-extra-chr \
        --keep ~/admixture_mapping/scripts/poplists/all.keep \
        --out all.thinned

        # output thinned bed
        ~/bin/plink --file all.chrom --extract all.plink.ld.prune.in --make-bed --allow-extra-chr \
        --keep ~/admixture_mapping/scripts/poplists/all.keep \
        --out all.thinned
