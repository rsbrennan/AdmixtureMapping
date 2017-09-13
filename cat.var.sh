#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o cat.var-stdout-%j.txt
#SBATCH -e cat.var-stderr-%j.txt
#SBATCH -J cat.var

# mod 2017-01-11

vcf-concat $(ls -1 ~/admixture_mapping/variants/all/*.vcf | perl -pe 's/\n/ /g') |\
bgzip -c > ~/admixture_mapping/variants/all.scaff.vcf.gz

### Merge files
#vcf-merge ~/admixture_mapping/variants/cb-all.70.chrom.split.vcf.gz ~/admixture_mapping/variants/AC-run-1.filtered.chrom.vcf.gz |\
#bgzip -c > ~/admixture_mapping/variants/AC-run-1_CB.vcf.gz

tabix -f -p vcf ~/admixture_mapping/variants/all.scaff.vcf.gz
