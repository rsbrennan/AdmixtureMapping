#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobimbam.gwas-stdout-%j.txt
#SBATCH -e tobimbam.gwas-stderr-%j.txt
#SBATCH -J tobimbam.gwas

cd ~/admixture_mapping/variants/

#convert AF.BC to bimbam
#think markers for ld
~/bin/plink --file ~/admixture_mapping/variants/AF.BC --indep 50 5 2 \
-out AF.BC.plink.ld

~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AF.BC \
	--extract AF.BC.plink.ld.prune.in \
        --recodeA --out ~/admixture_mapping/variants/AF.BC.thin

~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AF.BC \
        --recodeA --out ~/admixture_mapping/variants/AF.BC

#subsamp vcf and convert to plink for AF
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/AF.indivs \
--plink --out AF

# output thinned ped for AF
~/bin/plink --file ~/admixture_mapping/variants/AF --indep 50 5 2 \
-out AF.plink.ld

#convert to allele counts
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AF \
        --extract AF.plink.ld.prune.in \
        --recodeA --out ~/admixture_mapping/variants/AF.thin

#full data
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AF \
        --recodeA --out ~/admixture_mapping/variants/AF

#subsamp vcf and convert to plink for BC
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/BC.indivs \
--plink --out BC

# output thinned ped for BC
~/bin/plink --file ~/admixture_mapping/variants/BC --indep 50 5 2 \
-out BC.plink.ld

#convert BC to bimbam
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/BC \
        --extract BC.plink.ld.prune.in \
	--recodeA --out ~/admixture_mapping/variants/BC.thin
#full data
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/BC \
        --recodeA --out ~/admixture_mapping/variants/BC
