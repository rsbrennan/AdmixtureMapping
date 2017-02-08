#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o tobimbam-stdout-%j.txt
#SBATCH -e tobimbam-stderr-%j.txt
#SBATCH -J tobimbam

POP=PP
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done

POP=PL
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done

POP=AF
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done

POP=HP
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done

POP=BC
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done

POP=PC
for chrom in {1..24}; do
        ~/bin/plink-1.07-i686/plink --file ~/admixture_mapping/variants/plink/chr${chrom}.${POP} \
        --recode-bimbam --out ~/admixture_mapping/variants/bimbam/chr${chrom}.${POP}
done
