#!/bin/bash -l
#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o vcf-sub-stdout-%j.txt
#SBATCH -e vcf-sub-stderr-%j.txt
#SBATCH -J vcf-sub

cd ~/admixture_mapping/variants

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PL.indivs > PL-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PP.indivs > PP-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/AF.indivs > AF-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/BC.indivs > BC-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/HP.indivs > HP-chrom.vcf

zcat ~/admixture_mapping/variants/all.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/scripts/poplists/PC.indivs > PC-chrom.vcf
