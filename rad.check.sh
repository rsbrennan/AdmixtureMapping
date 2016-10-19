#!/bin/bash

#cd /home/rsbrenna/admixture_mapping/rawdata


~/bin/stacks-1.34/process_radtags \
-P -p ~/admixture_mapping/processed_data/demultiplex/AC/run-1/AC-5 \
-o ~/admixture_mapping/processed_data/radtag_checked/AC/run-1/AC-5 \
-e sbfI -E phred33 -r -D -i 'fastq'

