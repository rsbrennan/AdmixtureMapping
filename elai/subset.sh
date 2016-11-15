#!/bin/bash -l

#zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(PL-\S+))" |\
#cut -f 2 >  ~/admixture_mapping/variants/PL.list

zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/PL.list > PL-chrom.vcf

#zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(PP-\S+))" |\
#cut -f 2 >  ~/admixture_mapping/variants/PP.list

zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/PP.list > PP-chrom.vcf

#zcat  ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz | head -n 500 | grep '^#' | egrep -o "(\s(AF-\S+))" |\
#cut -f 2 >  ~/admixture_mapping/variants/AF.list

zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/AF.list > AF-chrom.vcf


#cat ~/admixture_mapping/variants/PP.list ~/admixture_mapping/variants/PL.list >\
#~/admixture_mapping/variants/PL_PP.list

#zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz |\
#~/bin/vcftools/perl/vcf-subset -c ~/admixture_mapping/variants/PL_PP.list > ~/admixture_mapping/variants/PL_PP-chrom.vcf
