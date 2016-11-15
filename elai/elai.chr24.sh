#!/bin/bash -l

cd ~/admixture_mapping/variants/plink/

cat chr24.AF.map | awk -F'\t' -vOFS='\t' '{ gsub("24", "x24", $1) ; print }' > chr24.AF.1.map
cat chr24.PP.map | awk -F'\t' -vOFS='\t' '{ gsub("24", "x24", $1) ; print }' > chr24.PP.1.map
cat chr24.PL.map | awk -F'\t' -vOFS='\t' '{ gsub("24", "x24", $1) ; print }' > chr24.PL.1.map

mv chr24.AF.1.map chr24.AF.map
mv chr24.PP.1.map chr24.PP.map
mv chr24.PL.1.map chr24.PL.map

#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr24.AF --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr24.AF
#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr24.PL --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr24.PL
#~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr24.PP --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr24.PP

