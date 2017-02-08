#!/bin/bash -l
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o bgc-stdout-%j.txt
#SBATCH -e bgc-stderr-%j.txt
#SBATCH -J bgc

POP=CB

module load pgi-12.6/hdf5-1.8.9
module load gsl/2.3
cd ~/admixture_mapping/analysis/bgc

~/bin/bgcdist/bgc \
	-a ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental1_BGC.txt \
	-b ~/admixture_mapping/variants/bgc/bgc_${POP}_Parental2_BGC.txt \
	-h ~/admixture_mapping/variants/bgc/bgc_${POP}_Admixed_BGC.txt \
	-M ~/admixture_mapping/variants/bgc/map.txt \
	-F ${POP} \ # prefix added to outfiles
	-O 0 \ #-Format to write MCMC samples: 0 = HDF5, 1 = ascii text, 2 = HDF5 and ascii text [default = 0].
	-x 10 \ #number of mcmc steps, default = 1000
	-n 1 \ #number of steps to discard as burnin
	-t 2 \ #thin chain by every nth value
	-p 1 \ #which parameter samps to print: 0=log likelihood, 1= also precision, 2=also eta and kappa
	-q 1 \ #calc cline parameter quantiles. used to designate outlier loci. boolean
	-N 1 \ #use genotype uncertainty model.
	-E 0.0001 \ # genome wide error prob.
	-m 1 \ # ICARrho model for linked loci with genetic map or physical map
	-D 43653.94 \ # Maximum distance between loci. change if using physical distance
	-d 1 \ # all loci are diploid
	-s 1 \ #sum-to-zero constrain on cline parameters. default=1
	-I 0 \ #Select algorithm to initialize MCMC-default =1. 0 = use info from the data to initialize ancestry and hybrid index, 1 = do not use information from the data to initialize ancestry and hybrid index.
	-u 0.1 \ # MCMC tuning parameter, maximum deviate from uniform for proposed hybrid index. default 0.1 seems that people sometimes change this.
	-g 0.05 \ #tuning parameter, stdev for Gaussian proposal of cline parameter gamma [default = 0.05]. can change this
	-z 0.05 \ # MCMC tuning parameter, stdev for Gaussian proposal of cline parameter zeta [default = 0.05]. can change this
	-e 0.02 # MCMC tuning parameter, stdev for Gaussian proposal of cline param eta and kappa [default = 0.02].

