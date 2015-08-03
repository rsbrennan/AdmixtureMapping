#!/bin/bash -l

cd ~/reference/

 ~/bin/freebayes/bin/freebayes \
-f ~/reference/killifish20130322asm.fa \ 
~/admixture_mapping/aligned/*sort.rg.bam \
--populations ~/admixture_mapping/scripts/population.list.txt \
|gzip > ~/admixture_mapping/aligned/out.vcf.gz
