#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o crossmap-stdout-%j.txt
#SBATCH -e crossmap-stderr-%j.txt
#SBATCH -J crossmap

module load python/2.7.4
module load crossmap
module load java/1.8


lib=AC

#convert bam
for i in $(ls ~/admixture_mapping/processed_data/aligned/${lib}-combined/*.bam |cut -f 8 -d "/" | cut -c -10 | sort | uniq )

	do {
	/share/apps/crossmap-0.2.5/bin/CrossMap.py bam \
	~/admixture_mapping/scripts/out.chain \
	~/admixture_mapping/processed_data/aligned/${lib}-combined/$i.combined.bam \
	~/admixture_mapping/processed_data/aligned/${lib}-combined/$i.chr
}

done

#/share/apps/crossmap-0.2.5/bin/CrossMap.py VCF \
#~/admixture_mapping/variants/out.chain \
#~/admixture_mapping/variants/all.vcf.gz \
#/reference/heteroclitus_chromosomes_2017-01-17.fa \
#~/admixture_mapping/variants/all.chrom.vcf

#module load picardtools/2.7.1

#java -Xms12G -Xmx18G -jar /share/apps/picard-tools-2.7.1/picard.jar LiftoverVcf \
#     TMP_DIR=/scratch \
#     I=~/admixture_mapping/variants/all.vcf.gz \
#     O=~/admixture_mapping/variants/all.chrom.vcf \
#     CHAIN=/home/jmiller1/bin/code/ALLMAPS_OUT/MF.Map/unsplit_merge.chain \
#     REJECT=~/admixture_mapping/variants/rejected_variants.vcf \
#     R=~/reference/unsplit_merge.fasta
