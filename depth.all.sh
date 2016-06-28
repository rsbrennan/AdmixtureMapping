#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/

#~/bin/samtools-1.3.1/samtools merge -  ~/admixture_mapping/processed_data/aligned/CB-1/cb-1.all.bam \
#~/admixture_mapping/processed_data/aligned/CB-2/cb-2.all.bam \
#~/admixture_mapping/processed_data/aligned/CB-3/cb-3.all.bam \
#~/admixture_mapping/processed_data/aligned/CB-4/cb-4.all.bam \
#> ~/admixture_mapping/processed_data/aligned/CB-1/cb-1.all.bam  | \

~/bin/samtools-1.3.1/samtools view -b -F 1024 ~/admixture_mapping/processed_data/aligned/CB-1/cb-1.all.bam | \
~/bin/samtools-1.3.1/samtools depth - > CB-all.depth

#cd ~/admixture_mapping/processed_data/aligned/CB-2/
#~/bin/samtools-1.3.1/samtools merge - *.bam \
#> ~/admixture_mapping/processed_data/aligned/CB-2/cb-2.all.bam

#cd ~/admixture_mapping/processed_data/aligned/CB-3/
#~/bin/samtools-1.3.1/samtools merge - *.bam \
#> ~/admixture_mapping/processed_data/aligned/CB-3/cb-3.all.bam

#cd ~/admixture_mapping/processed_data/aligned/CB-4/
#~/bin/samtools-1.3.1/samtools merge - *.bam \
#> ~/admixture_mapping/processed_data/aligned/CB-4/cb-4.all.bam
