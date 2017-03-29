#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobgc-stdout-%j.txt
#SBATCH -e tobgc-stderr-%j.txt
#SBATCH -J tobgc


R CMD BATCH ~/admixture_mapping/scripts/bgc/tobgc.R


#change locus_SNP_# to locus_#

cd ~/admixture_mapping/variants/bgc/

sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_CB_Parental1_BGC.txt
sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_CB_Parental2_BGC.txt
sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_CB_Admixed_BGC.txt
sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_AC_Parental1_BGC.txt
sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_AC_Parental2_BGC.txt
sed -i 's/SNP_//g' ~/admixture_mapping/variants/bgc/bgc_AC_Admixed_BGC.txt


#need to make the physical map
##locus number, chromosome number, location in kb bp.

cat ~/admixture_mapping/variants/AC.thin.map |\
awk -vOFMT=%10.2f  'BEGIN{OFS=" "}{print $1, $4/1000}' >\
~/admixture_mapping/variants/bgc/map.txt

cat ~/admixture_mapping/variants/bgc/bgc_CB_Parental1_BGC.txt |\
grep 'locus' |\
cut -f 2 -d "_" |\
paste - ~/admixture_mapping/variants/bgc/map.txt > ~/admixture_mapping/variants/bgc/map.txt.1

mv ~/admixture_mapping/variants/bgc/map.txt.1 ~/admixture_mapping/variants/bgc/map.txt
