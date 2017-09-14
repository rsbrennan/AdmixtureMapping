#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o format_master-stdout-%j.txt
#SBATCH -e format_master-stderr-%j.txt
#SBATCH -J format_master

# master pipeline to run filtering

DATE=`date +%Y-%m-%d`
now=$(date +"%T")

echo "Script run on ${DATE} at ${now}"

# Create a unique prefix for the names of all jobs in this
# particular run of the pipeline. This makes sure that runs can be
# identified unambiguously
run=$(uuidgen | tr '-' ' ' | awk '{print $1}')

echo "ID for this run is: ${run}"


# convert to genetic map
jid1=$(sbatch -p high -t 30:00:00 --mem=26g \
        /home/rsbrenna/admixture_mapping/scripts/genetic_map_convert.sh)
step1=$(echo $jid1 | cut -f 4 -d " ") #get job id
echo "${step1} submitted--genetic_map_convert.sh"

#format output
jid2=$(sbatch -p high -t 30:00:00 --mem=6g --dependency=afterok:${step1} \
        /home/rsbrenna/admixture_mapping/scripts/format.sh)
now=$(date +"%T")
step2=$(echo $jid2 | cut -f 4 -d " ") #get job id
echo "${step2} submitted--format.sh, will wait on job ${step1} before starting"


###
### convert vcf to ped
###

# convert to plink
jid3=$(sbatch -p high -t 4:00:00 --dependency=afterok:${step2} \
		/home/rsbrenna/admixture_mapping/scripts/1.toplink.sh)
step3=$(echo $jid3 | cut -f 4 -d " ") #get job id
echo "${step3} submitted--1.toplink.sh, will wait on job ${step2} before starting"

#
# convert to bed
jid4=$(sbatch -p high -t 4:00:00 --dependency=afterok:${step3} \
        /home/rsbrenna/admixture_mapping/scripts/2.tobed.sh)
step4=$(echo $jid4 | cut -f 4 -d " ") #get job id
echo "${step4} submitted--2.tobed.sh, will wait on job ${step3} before starting"
