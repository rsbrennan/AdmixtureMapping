#!/bin/bash -l
#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o vcf-sub_freq-stdout-%j.txt
#SBATCH -e vcf-sub_freq-stderr-%j.txt
#SBATCH -J vcf-sub_freq

cd ~/admixture_mapping/variants

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PL.pop > PL-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PP.pop > PP-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/AF.pop > AF-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/BC.pop > BC-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/HP.pop > HP-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PC.pop > PC-chrom.vcf
