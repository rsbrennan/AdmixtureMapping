#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o genepop_bgc-stdout-%j.txt
#SBATCH -e genepop_bgc-stderr-%j.txt
#SBATCH -J genepop_bgc


#Pops are AC and CB

POP=CB
cd ~/admixture_mapping/variants/bgc

java -Xmx20024m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar -inputfile ~/admixture_mapping/variants/${POP}.recode.vcf -inputformat VCF -outputfile ${POP}.genepop -outputformat GENEPOP -spid ~/admixture_mapping/scripts/bgc/${POP}.genepop.spid

cat AC.genepop | sed 's/HP-/HP_/g' | sed 's/PC-/PC_/g' | sed 's/BC-/BC_/g' >  AC_mod.genepop
mv AC_mod.genepop AC.genepop
cat CB.genepop | sed 's/PP-/PP_/g' | sed 's/PL-/PL_/g' | sed 's/AF-/AF_/g' >  CB_mod.genepop
mv CB_mod.genepop CB.genepop
