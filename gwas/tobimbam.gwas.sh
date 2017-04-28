#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobimbam.gwas-stdout-%j.txt
#SBATCH -e tobimbam.gwas-stderr-%j.txt
#SBATCH -J tobimbam.gwas

module load vcftools/0.1.13

cd ~/admixture_mapping/variants/gwas/

for i in AF AF.BC BC CB AC N_S.remove; do

	#subsamp vcf and convert to plink
	zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
	sed 's/chr//g' |\
	vcftools --vcf - \
	--keep ~/admixture_mapping/scripts/poplists/${i}.indivs \
	--plink --chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
	--out ~/admixture_mapping/variants/gwas/${i}

	# output thinned ped
	#~/bin/plink --file ~/admixture_mapping/variants/${i} --indep 50 5 2 \
	#-out ${i}.plink.ld

	#convert to allele counts
	#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/${i} \
        #--extract ${i}.plink.ld.prune.in \
        #--recodeA --out ~/admixture_mapping/variants/${i}.thin

	#full data
	~/bin/plink-1.07-i686/plink --noweb --file ~/admixture_mapping/variants/gwas/${i} \
        --recodeA --out ~/admixture_mapping/variants/gwas/${i}

done
