#!/bin/bash -l
#SBATCH -J array_job
#SBATCH -o errorout/array_job_out_%A_%a.txt
#SBATCH -e errorout/array_job_err_%A_%a.txt
#SBATCH --array=1-96
#SBATCH -p hi
#SBATCH --mem=10000
#SBATCH --cpus-per-task=6
###### number of nodes
###### number of processors
####SBATCH -n 1

indir=~/admixture_mapping/processed_data/radtag_checked/2015/
my_samtools=~/bin/samtools-1.3.1/samtools
my_bwa=~/bin/bwa-0.7.12/bwa
my_samblstr=~/bin/samblaster/samblaster
bwagenind=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa
outdir=~/admixture_mapping/processed_data/aligned/2015/

fq1=$(find $indir -name "*_R1_001.1.fq" | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
fq2=$(echo $fq1 | sed 's/_R1_001.1/_R2_001.2/g')
root=$(echo $fq1 | sed 's/.*\///' | sed 's/_R._/_/' | cut -c -10)
rg=$(echo \@RG\\tID:CB-1-$root\\tPL:Illumina\\tPU:x\\tLB:first-CB-1\\tSM:$root)
tempsort=$root.temp
outfile=$outdir$root.bam

echo $root
echo $fq1
echo $fq2
echo $rg
echo $tempsort
echo $outfile

$my_bwa mem -t 6 -R $rg $bwagenind $fq1 $fq2 | $my_samblstr | $my_samtools view -S -h -u - | $my_samtools sort - -T /scratch/$tempsort -O bam -o $outfile
