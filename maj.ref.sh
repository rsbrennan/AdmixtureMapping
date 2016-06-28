#!/bin/bash -l

#cd /admixture_mapping/processed_data/aligned/CB-4/

java -Xmx10g -jar ~/bin/GenomeAnalysisTK.jar \
-T FastaAlternateReferenceMaker \
-R ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa  \
-o maj.fasta \
-V ~/admixture_mapping/processed_data/aligned/CB-4/majalis.recode.vcf
#-L ~/admixture_mapping/scripts/interval.list
