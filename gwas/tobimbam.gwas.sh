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


########## Include parent pops #############

#N_S.remove.indivs

#subsamp vcf and convert to plink for CB
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/CB.indivs \
--plink --out CB

# output thinned ped for AF
~/bin/plink --file ~/admixture_mapping/variants/CB --indep 50 5 2 \
-out CB.plink.ld

#convert to allele counts
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/CB \
        --extract CB.plink.ld.prune.in \
        --recodeA --out ~/admixture_mapping/variants/CB.thin

#full data
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/CB \
        --recodeA --out ~/admixture_mapping/variants/CB


##################
#subsamp vcf and convert to plink for AC
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/AC.indivs \
--plink --out AC

# output thinned ped for AF
~/bin/plink --file ~/admixture_mapping/variants/AC --indep 50 5 2 \
-out AC.plink.ld

#convert to allele counts
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AC \
        --extract AC.plink.ld.prune.in \
        --recodeA --out ~/admixture_mapping/variants/AC.thin

#full data
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/AC \
        --recodeA --out ~/admixture_mapping/variants/AC

##################
#subsamp vcf and convert to plink for N_S_remove
zcat ~/admixture_mapping/variants/all.chrom.vcf.gz  |\
sed 's/chr//g' |\
~/bin/vcftools/bin/vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/N_S.remove.indivs \
--plink --out N_S.remove

# output thinned ped for AF
~/bin/plink --file ~/admixture_mapping/variants/N_S.remove --indep 50 5 2 \
-out N_S.remove.plink.ld

#convert to allele counts
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/N_S.remove \
        --extract N_S.remove.plink.ld.prune.in \
        --recodeA --out ~/admixture_mapping/variants/N_S.remove.thin

#full data
~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/N_S.remove \
        --recodeA --out ~/admixture_mapping/variants/N_S.remove

