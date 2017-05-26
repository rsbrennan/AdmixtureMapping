#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobayescan-stdout-%j.txt
#SBATCH -e tobayescan-stderr-%j.txt
#SBATCH -J tobayescan

module load vcftools/0.1.13

cd ~/admixture_mapping/variants/

#vcftools --gzvcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
#	--keep ~/admixture_mapping/scripts/poplists/HP.PC.indivs \
#	--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
#	--recode --out PC.HP

#vcftools --gzvcf ~/admixture_mapping/variants/all.chrom.vcf.gz \
#       --keep ~/admixture_mapping/scripts/poplists/PP.PL.indivs \
#	--chrom-map ~/admixture_mapping/variants/plink-chrom-map.txt \
#	--recode --out PP.PL


cd ~/admixture_mapping/variants/bayescan/

#java -Xmx10000m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar \
#        -inputfile ~/admixture_mapping/variants/PC.HP.recode.vcf \
#        -inputformat VCF \
#        -outputfile PC.HP \
#        -outputformat GESTE_BAYE_SCAN \
#        -spid ~/admixture_mapping/scripts/PC.HP.spid

java -Xmx10000m -Xms512M -jar ~/bin/PGDSpider_2.1.0.3/PGDSpider2-cli.jar \
        -inputfile ~/admixture_mapping/variants/PP.PL.recode.vcf \
        -inputformat VCF \
        -outputfile PP.PL.bscn \
        -outputformat GESTE_BAYE_SCAN \
        -spid ~/admixture_mapping/scripts/PP.PL.spid
