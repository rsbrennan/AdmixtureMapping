#!/bin/bash -l

#module load python

cd ~/reference/

python ~/admixture_mapping/scripts/probe.identify.py

mv ~/reference/SbfI_list.depth.txt ~/admixture_mapping/scripts/
