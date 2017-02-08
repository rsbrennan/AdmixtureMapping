#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o genepop_bgc-stdout-%j.txt
#SBATCH -e genepop_bgc-stderr-%j.txt
#SBATCH -J genepop_bgc


#Pops are AC and CB

POP=CB
cd ~/admixture_mapping/analysis/bgc

java -Xmx20024m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar -inputfile ~/admixture_mapping/variants/${POP}.recode.vcf -inputformat VCF -outputfile ${POP}.genepop -outputformat GENEPOP -spid ~/admixture_mapping/scripts/bgc/${POP}.genepop.spid

