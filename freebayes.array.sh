#!/bin/bash -l
#SBATCH -J array_job
#SBATCH -o errorout/array_job_out_%A_%a.txt
#SBATCH -e errorout/array_job_err_%A_%a.txt
#SBATCH --array=1-10180
#SBATCH -p med
#SBATCH --mem=12000
###### number of nodes
###### number of processors
#SBATCH --cpus-per-task=6

# mod 2017-01-11

bwagenind=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa
my_freebayes=~/bin/freebayes/bin/freebayes
my_bedtools=~/bin/bedtools2/bin/bedtools
my_bamtools=~/bin/bamtools/bin/bamtools

start=12224400.1
scafnum=$(expr "scale=9; $SLURM_ARRAY_TASK_ID + $start" | bc)
scaf=NW_0$scafnum
echo $scafnum
echo $scaf

endpos=$(expr $(grep -P "$scaf\t" ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa.fai | cut -f 2) - 1)

echo $endpos

region=$scaf:1..$endpos
echo $region

outfile=$scaf.vcf

vcf_out=~/admixture_mapping/variants/all
bam_list=~/admixture_mapping/scripts/bam.all.list
pop_list=~/admixture_mapping/scripts/pop.list.all

$my_bamtools merge -list $bam_list -region $region| \
$my_bamtools filter -in stdin -mapQuality '>30' -isProperPair true | \
$my_freebayes -f $bwagenind --use-best-n-alleles 4 --pooled-discrete \
--populations $pop_list --stdin > $vcf_out/$outfile


