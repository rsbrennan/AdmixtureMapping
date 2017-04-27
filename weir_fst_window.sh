#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o weir_window-stdout-%j.txt
#SBATCH -e weir_window-stderr-%j.txt
#SBATCH -J weir_window

module load vcftools/0.1.13

cd ~/admixture_mapping/analysis/fst

#1 PP vs PL
P1=PP
P2=PL
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--fst-window-size 150000 \
--fst-window-step 25000 \
--out ${P1}_vs_${P2}

#1 HP vs PC
P1=PC
P2=HP
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--fst-window-size 150000 \
--fst-window-step 25000 \
--out ${P1}_vs_${P2}

