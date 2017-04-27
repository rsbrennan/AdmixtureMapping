#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o weir_fst-stdout-%j.txt
#SBATCH -e weir_fst-stderr-%j.txt
#SBATCH -J weir_fst

cd ~/admixture_mapping/analysis/fst

module load vcftools/0.1.13

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
--out ${P1}_vs_${P2}

#2 pp vs af
P1=PP
P2=AF
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#3 PP vs GA
P1=PP
P2=GA
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#4 PP vs HP
P1=PP
P2=HP
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#5 PP vs BC
P1=PP
P2=BC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
	> ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#6 PP vs PC
P1=PP
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#7 PP vs TR
P1=PP
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#8 PL vs AF
P1=PL
P2=AF
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#9 PL vs GA
P1=PL
P2=GA
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#10 PL vs HP
P1=PL
P2=HP
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#11 PL vs BC
P1=PL
P2=BC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#12 PL vs PC
P1=PL
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#13 PL vs TR
P1=PL
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#14 AF vs GA
P1=AF
P2=GA
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#15 AF vs HP
P1=AF
P2=HP
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#16 AF vs BC
P1=AF
P2=BC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#17 AF vs PC
P1=AF
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#18 AF vs TR
P1=AF
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#19 GA vs HP
P1=GA
P2=HP
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#20 GA vs BC
P1=GA
P2=BC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#21 GA vs PC
P1=GA
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#22 GA vs TR
P1=GA
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#23 HP vs BC
P1=HP
P2=BC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#24 HP vs PC
P1=HP
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#25 HP vs TR
P1=HP
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#26 BC vs PC
P1=BC
P2=PC
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#27 BC vs TR
P1=BC
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}

#28 PC vs TR
P1=PC
P2=TR
cat  ~/admixture_mapping/scripts/poplists/${P1}.indivs  ~/admixture_mapping/scripts/poplists/${P2}.indivs \
        > ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs

zcat  ~/admixture_mapping/variants/all.chrom.vcf.gz |\
sed 's/\.:\.:\.:\.:\.:\.:\./\.\/\.:\.:\.:\.:\.:\.:\./g' |\
vcftools --vcf - \
--keep ~/admixture_mapping/scripts/poplists/${P1}.${P2}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P1}.indivs \
--weir-fst-pop ~/admixture_mapping/scripts/poplists/${P2}.indivs \
--out ${P1}_vs_${P2}
