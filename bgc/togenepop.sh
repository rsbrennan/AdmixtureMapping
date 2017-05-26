#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o genepop_bgc-stdout-%j.txt
#SBATCH -e genepop_bgc-stderr-%j.txt
#SBATCH -J genepop_bgc

cd ~/admixture_mapping/variants/

#change family variable to pop for downstream pop def in genepop

awk -F " " '{gsub(/-[0-9]+\-[0-9]+/,"", $1);print}' CB.thinned.ped > CB.thinned.ped.1
mv CB.thinned.ped.1 CB.thinned.ped

awk -F " " '{gsub(/-[0-9]+\-[0-9]+/,"", $1);print}' AC.thinned.ped > AC.thinned.ped.1
mv AC.thinned.ped.1 AC.thinned.ped

#Pops are AC and CB

POP=AC

java -Xmx20024m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar -inputfile ~/admixture_mapping/variants/${POP}.thinned.ped -inputformat PED -outputfile ${POP}.genepop -outputformat GENEPOP -spid ~/admixture_mapping/scripts/bgc/${POP}.genepop.spid

POP=CB

java -Xmx20024m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar -inputfile ~/admixture_mapping/variants/${POP}.thinned.ped -inputformat PED -outputfile ${POP}.genepop -outputformat GENEPOP -spid ~/admixture_mapping/scripts/bgc/${POP}.genepop.spid

cat AC.genepop | sed 's/HP-/HP_/g' | sed 's/PC-/PC_/g' | sed 's/BC-/BC_/g' >  AC_mod.genepop
mv AC_mod.genepop bgc/AC.genepop
cat CB.genepop | sed 's/PP-/PP_/g' | sed 's/PL-/PL_/g' | sed 's/AF-/AF_/g' >  CB_mod.genepop
mv CB_mod.genepop bgc/CB.genepop
