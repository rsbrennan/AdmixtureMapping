#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o weir_fst-stdout-%j.txt
#SBATCH -e weir_fst-stderr-%j.txt
#SBATCH -J weir_fst

cd ~/admixture_mapping/analysis/fst

module load vcftools/0.1.13

for POP in cb all; do

#1 PP vs PL
P1=PP
P2=PL
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/${POP}.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}.${POP}

#2 pp vs af
P1=PP
P2=AF
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/${POP}.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}.${POP}

#8 PL vs AF
P1=PL
P2=AF
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/${POP}.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}.${POP}

done
