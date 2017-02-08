#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o download-stdout-%j.txt
#SBATCH -e download-stderr-%j.txt
#SBATCH -J download

# mod 2017-01-11


#AC run 2
cd ~/admixture_mapping/rawdata/AC/run-2/lane2/

#lane 2:
wget -r -nH -nc -np -R index.html* "http://slims.bioinformatics.ucdavis.edu/Data/x9kx5hz303"

cd ~/admixture_mapping/rawdata/AC/run-2/lane3/

#lane 3:
wget -r -nH -nc -np -R index.html* "http://slims.bioinformatics.ucdavis.edu/Data/4rs347xm3z"
