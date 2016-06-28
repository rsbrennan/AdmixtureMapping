#!/bin/bash -l

cd ~/reference/

~/bin/freebayes/bin/freebayes \
-f ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa \
~/admixture_mapping/processed_data/aligned/CB-1/*.bam \
--populations ~/admixture_mapping/scripts/pop.list.cb-4.txt |\
~/bin/vcflib/bin/vcffilter -f "QUAL > 20" | bgzip -c  > ~/admixture_mapping/scripts/CB-4.vcf.gz

