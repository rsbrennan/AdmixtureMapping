#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/CB-4/

~/bin/samtools-1.3.1/samtools view -b -h  PL-783-035.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PL-783-035.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PL-784-036.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PL-784-036.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PL-786-038.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PL-786-038.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PL-787-039.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PL-787-039.filtered.bam


~/bin/samtools-1.3.1/samtools view -b -h PP-456-035.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PP-456-035.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PP-457-036.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PP-457-036.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PP-458-037.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PP-458-037.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h PP-459-038.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> PP-459-038.filtered.bam


~/bin/samtools-1.3.1/samtools view -b -h Fdiaph-001.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> Fdiaph-001.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h Fdiaph-003.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> Fdiaph-003.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h Fdiaph-004.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> Fdiaph-004.filtered.bam

~/bin/samtools-1.3.1/samtools view -b -h Fdiaph-005.bam -L ~/admixture_mapping/processed_data/aligned/CB-4/majalis.bed \
> Fdiaph-005.filtered.bam
