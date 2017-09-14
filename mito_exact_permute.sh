#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o mito_exact_permute-stdout-%j.txt
#SBATCH -e mito_exact_permute-stderr-%j.txt
#SBATCH -J mito_exact_permute

cd ~/admixture_mapping/variants/gwas/

#remove indivs with missing mitotypes
# line 10, 13, 24
cat ~/admixture_mapping/variants/gwas/AF.mito.ped | sed '24d' | sed '13d' | sed '10d' > ~/admixture_mapping/variants/gwas/AF.permute.ped

cp  ~/admixture_mapping/variants/gwas/AF.mito.map  ~/admixture_mapping/variants/gwas/AF.permute.map

#isolate first cols
cut -f 1-2 ~/admixture_mapping/variants/gwas/AF.permute.ped > col.1

# run permuration
#takes about 23 seconds/rep. which means a little under 3.5 hours for 500 reps
for i in {1..500}
do

	#shuffle col labels
	cut -f 6 ~/admixture_mapping/variants/gwas/AF.permute.ped | shuf > col.pheno 

	#paste all together
	paste col.1 col.pheno -d "\t" > ~/admixture_mapping/variants/gwas/pheno.permute

	~/bin/plink-1.07-i686/plink --noweb --silent --file ~/admixture_mapping/variants/gwas/AF.permute --pheno ~/admixture_mapping/variants/gwas/pheno.permute --allow-no-sex --fisher

	awk -v x=0.01 '$8 < x' ~/admixture_mapping/variants/gwas/plink.assoc.fisher | wc -l >> ~/admixture_mapping/analysis/gwas/mito_exact_permute_out.txt

	echo $i
done
