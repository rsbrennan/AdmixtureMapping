#!/bin/bash -l


cd ~/admixture_mapping/processed_data/aligned/CB-1/

~/bin/samtools-1.3.1/samtools view -h -b -F 4 AF-486-001.bam | ~/bin/samtools-1.3.1/samtools view -h -b  -F 0x400 - | ~/bin/samtools-1.3.1/samtools depth - >AF-486-001.depth
