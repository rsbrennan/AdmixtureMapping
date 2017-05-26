#!/bin/bash -l
#SBATCH -J array_job
#SBATCH -o errorout/array_job_out_%A_%a.txt
#SBATCH -e errorout/array_job_err_%A_%a.txt
#SBATCH --array=1-96
#SBATCH -p med
#SBATCH --mem=10000
#SBATCH --cpus-per-task=6
###### number of nodes
###### number of processors
####SBATCH -n 1

# mod 2017-01-11

lib=AC-1
run=run-1
indir=~/admixture_mapping/processed_data/demultiplex/AC/$run/$lib/
my_samtools=~/bin/samtools-1.3.1/samtools
my_bwa=~/bin/bwa-0.7.12/bwa
my_samblstr=~/bin/samblaster/samblaster
bwagenind=~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa
outdir=~/admixture_mapping/processed_data/aligned/AC/$run/$lib

fq1=$(find $indir -name "*_RA.fastq" | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
fq2=$(echo $fq1 | sed 's/_RA/_RB/g')
root=$(echo $fq1 | sed 's/.*\///' | cut -f 1 -d "_")
rg=$(echo \@RG\\tID:$lib\-$root\\tPL:Illumina\\tPU:x\\tLB:$run-$lib\\tSM:$root)
tempsort=$root.temp
outfile=$outdir/$root.bam
echo $SLURM_ARRAY_TASK_ID
echo $root
echo $fq1
echo $fq2
echo $rg
echo $tempsort
echo $outfile
echo $outdir


$my_bwa mem -t 6 -R $rg $bwagenind $fq1 $fq2 | \
$my_samblstr | \
$my_samtools view -S -h -u - | \
$my_samtools sort - -T /scratch/$tempsort -O bam -o $outfile
