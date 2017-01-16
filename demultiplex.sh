#!/bin/bash
#SBATCH --mail-type=END
#SBATCH --mail-user=rsbrennan@ucdavis.edu
#SBATCH -D /home/rsbrenna/admixture_mapping/scripts/slurm-log/
#SBATCH -o demultiplex_AC-stdout-%j.txt
#SBATCH -e demultiplex_AC-stderr-%j.txt
#SBATCH -J demultiplex

# mod 2017-01-11


#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/Admixture_Mapping/rawdata/RSB-AM-CB-1_S209_L008_R1_001.fastq ~/Admixture_Mapping/rawdata/RSB-AM-CB-1_S209_L008_R3_001.fastq ACAAGCTA,AAACATCG,ACATTGGC,ACCACTGT,AACGTGAT,CGCTGATC,CAGATCTG,ATGCCTAA,AACGAACG,AGTACAAG,CATCAAGT,AGTGGTCA,AACAACCA,AACCGAGA,AACGCTTA,AAGACGGA,AAGGTACA,ACACAGAA,ACAGCAGA,ACCTCCAA,ACGCTCGA,ACGTATCA,ACTATGCA,AGAGTCAA,AGATCGCA,AGCAGGAA,AGTCACTA,ATCCTGTA,ATTGAGGA,CAACCACA,CAAGACTA,CAATGGAA,CACTTCGA,CAGCGTTA,CATACCAA,CCAGTTCA,CCGAAGTA,CCGTGAGA,CCTCCTGA,CGAACTTA,CGACTGGA,CGCATACA,CTCAATGA,CTGAGCCA,CTGGCATA,GAATCTGA,GACTAGTA,GAGCTGAA,GATAGACA,GCCACATA,GCGAGTAA,GCTAACGA,GCTCGGTA,GGAGAACA,GGTGCGAA,GTACGCAA,GTCGTAGA,GTCTGTCA,GTGTTCTA,TAGGATGA,TATCAGCA,TCCGTCTA,TCTTCACA,TGAAGAGA,TGGAACAA,TGGCTTCA,TGGTGGTA,TTCACGCA,ACACGAGA,AAGAGATC,AAGGACAC,AATCCGTC,AATGTTGC,ACACTGAC,ACAGATTC,AGATGTAC,AGCACCTC,AGCCATGC,AGGCTAAC,ATAGCGAC,ACGACAAG,ATTGGCTC,CAAGGAGC,CACCTTAC,CCATCCTC,CCGACAAC,AGTCAAGC,CCTCTATC,CGACACAC,CGGATTGC,CTAAGGTC,GAACAGGC,GACAGTGC,GAGTTAGC,GATGAATC,GCCAAGAC RSB-AM-CB-1

#CB-1
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/normalizing-run/CB-1_S2_L001_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/normalizing-run/CB-1_S2_L001_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/CB-1/CB-1

#CB-2
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/normalizing-run/CB-2_S1_L001_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/normalizing-run/CB-2_S1_L001_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/CB-2/CB-2

#CB-3
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/normalizing-run/CB-3_S3_L001_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/normalizing-run/CB-3_S3_L001_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/CB-3/CB-3

#CB-4
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/normalizing-run/CB-4_S4_L001_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/normalizing-run/CB-4_S4_L001_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/CB-4/CB-4


###### Renormalizing Run ##########


#CB-1
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/cb-renorm/CB-1_S124_L007_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/cb-renorm/CB-1_S124_L007_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/cb-renorm/CB-1/

#CB-2
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/cb-renorm/CB-2_S125_L007_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/cb-renorm/CB-2_S125_L007_R2_001.fastq.gz  GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/cb-renorm/CB-2/

#CB-3
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/cb-renorm/CB-3_S126_L007_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/cb-renorm/CB-3_S126_L007_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/cb-renorm/CB-3/

#CB-4
#perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/2016/cb-renorm/CB-4_S127_L007_R1_001.fastq.gz ~/admixture_mapping/rawdata/2016/cb-renorm/CB-4_S127_L007_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/cb-renorm/CB-4/




### AC, run 1

for lib in $(ls ~/admixture_mapping/rawdata/AC/run-1/AC-*_R1*)
do

        base=$(basename $lib "_R1_001.qc.fq.gz")
        echo $base
        name=$(echo $base | cut -f 1-3 -d "_")
        echo $name
        library=$(echo $name | cut -f 1 -d "_" | cut -c 4)
        echo $library

perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/AC/run-1/${name}_R1_001.fastq.gz ~/admixture_mapping/rawdata/AC/run-1/${name}_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/AC/run-1/AC-${library}/

done


#### AC, run-2. Lane 2

#for lib in $(ls ~/admixture_mapping/rawdata/AC/run-2/lane2/AC-*_R1*)
#do

#	base=$(basename $lib "_R1_001.qc.fq.gz")
#	echo $base
#	name=$(echo $base | cut -f 1-3 -d "_")
#	echo $name
#	library=$(echo $name | cut -f 1 -d "_" | cut -c 5)
#	echo $library
#
#	perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/AC/run-2/lane2/${name}_R1_001.fastq.gz ~/admixture_mapping/rawdata/AC/run-2/lane2/${name}_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane2/AC-${library}/
#
#done


#### AC, run-2, Lane 3
#for lib in $(ls ~/admixture_mapping/rawdata/AC/run-2/lane3/AC-*_R1*)
#do

#	base=$(basename $lib "_R1_001.qc.fq.gz")
#	echo $base
#	name=$(echo $base | cut -f 1-3 -d "_")
#	echo $name
#	library=$(echo $name | cut -f 1 -d "_" | cut -c 5)
#	echo $library

#	perl /home/rsbrenna/scripts/BarcodeSplitListBestRadPairedEnd.pl ~/admixture_mapping/rawdata/AC/run-2/lane3/${name}_R1_001.fastq.gz ~/admixture_mapping/rawdata/AC/run-2/lane3/${name}_R2_001.fastq.gz GGACAAGCTA,GGAAACATCG,GGACATTGGC,GGACCACTGT,GGAACGTGAT,GGCGCTGATC,GGCAGATCTG,GGATGCCTAA,GGAACGAACG,GGAGTACAAG,GGCATCAAGT,GGAGTGGTCA,GGAACAACCA,GGAACCGAGA,GGAACGCTTA,GGAAGACGGA,GGAAGGTACA,GGACACAGAA,GGACAGCAGA,GGACCTCCAA,GGACGCTCGA,GGACGTATCA,GGACTATGCA,GGAGAGTCAA,GGAGATCGCA,GGAGCAGGAA,GGAGTCACTA,GGATCCTGTA,GGATTGAGGA,GGCAACCACA,GGCAAGACTA,GGCAATGGAA,GGCACTTCGA,GGCAGCGTTA,GGCATACCAA,GGCCAGTTCA,GGCCGAAGTA,GGCCGTGAGA,GGCCTCCTGA,GGCGAACTTA,GGCGACTGGA,GGCGCATACA,GGCTCAATGA,GGCTGAGCCA,GGCTGGCATA,GGGAATCTGA,GGGACTAGTA,GGGAGCTGAA,GGGATAGACA,GGGCCACATA,GGGCGAGTAA,GGGCTAACGA,GGGCTCGGTA,GGGGAGAACA,GGGGTGCGAA,GGGTACGCAA,GGGTCGTAGA,GGGTCTGTCA,GGGTGTTCTA,GGTAGGATGA,GGTATCAGCA,GGTCCGTCTA,GGTCTTCACA,GGTGAAGAGA,GGTGGAACAA,GGTGGCTTCA,GGTGGTGGTA,GGTTCACGCA,GGACACGAGA,GGAAGAGATC,GGAAGGACAC,GGAATCCGTC,GGAATGTTGC,GGACACTGAC,GGACAGATTC,GGAGATGTAC,GGAGCACCTC,GGAGCCATGC,GGAGGCTAAC,GGATAGCGAC,GGACGACAAG,GGATTGGCTC,GGCAAGGAGC,GGCACCTTAC,GGCCATCCTC,GGCCGACAAC,GGAGTCAAGC,GGCCTCTATC,GGCGACACAC,GGCGGATTGC,GGCTAAGGTC,GGGAACAGGC,GGGACAGTGC,GGGAGTTAGC,GGGATGAATC,GGGCCAAGAC ~/admixture_mapping/processed_data/demultiplex/AC/run-2/lane3/AC-${library}/

#done
