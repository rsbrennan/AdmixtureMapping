#!/bin/bash -l

#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr1.PP \
#--recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr1.PP

#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr1.PL \
#--recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr1.PL

#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr1.AF \
#--recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr1.AF

for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.PP \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.PP

done

for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.PL \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.PL

done

for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.AF \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.AF

done

