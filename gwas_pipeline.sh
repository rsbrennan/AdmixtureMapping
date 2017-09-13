#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o gwas_pipeline-stdout-%j.txt
#SBATCH -e gwas_pipeline-stderr-%j.txt
#SBATCH -J gwas_pipeline

# master pipeline to run gwas

DATE=`date +%Y-%m-%d`
now=$(date +"%T")

echo "Script run on ${DATE} at ${now}"

#convert files to plink dosage format
jid1=$(sbatch -p high -t 12:00:00 \
	/home/rsbrenna/admixture_mapping/scripts/gwas/gwas.1.toplink.sh)
step1=$(echo $jid1 | cut -f 4 -d " ") #get job id
echo "${step1} submitted--gwas.1.toplink.sh"

#convert to bimbam
jid2=$(sbatch -p high -t 30:00:00 --mem=30g --dependency=afterok:${step1} \
        /home/rsbrenna/admixture_mapping/scripts/gwas/gwas.2.bimbam.sh)
step2=$(echo $jid2 | cut -f 4 -d " ") #get job id
echo "${step2} submitted--gwas.2.bimbam.sh, will wait on job ${step1} before starting"


#calculate relatedness matrix
jid3=$(sbatch -p high -t 4:00:00 --mem=6g --dependency=afterok:${step2} \
	/home/rsbrenna/admixture_mapping/scripts/gwas/gwas.3.relatedness.sh)
step3=$(echo $jid3 | cut -f 4 -d " ") #get job id
echo "${step3} submitted--gwas.3.relatedness.sh, will wait on job ${step2} before starting"

#write covariate files, format input files

jid4=$(sbatch -p high -t 4:00:00 --dependency=afterok:${step3} \
        /home/rsbrenna/admixture_mapping/scripts/gwas/gwas.4.format.sh)
step4=$(echo $jid4 | cut -f 4 -d " ") #get job id
echo "${step4} submitted--gwas.4.format.sh, will wait on job ${step3} before starting"

# run actual GWAS

jid5=$(sbatch -p high -t 6:00:00 --dependency=afterok:${step4} \
        /home/rsbrenna/admixture_mapping/scripts/gwas/gwas.5.gemma.sh)
step5=$(echo $jid5 | cut -f 4 -d " ") #get job id
echo "${step5} submitted--gwas.5.gemma.sh, will wait on job ${step4} before starting"
