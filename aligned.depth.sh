#!/bin/bash -l

cd ~/admixture_mapping/processed_data/aligned/CB-4/

for i in $(ls *.bam | cut -c -10 )

do {
ONE=$(~/bin/samtools-1.3.1/samtools view -h -b -F 4 ${i}.bam | ~/bin/samtools-1.3.1/samtools view -h -b  -F 0x400 - | ~/bin/samtools-1.3.1/samtools depth -  | cut -f 3 | \
sort -n | awk '
  BEGIN {
    c = 0;
    sum = 0;
  }
  $1 ~ /^[0-9]*(\.[0-9]*)?$/ {
    a[c++] = $1;
    sum += $1;
    sumsq+= $1*$1
}
  END {
    ave = sum / c;
    if( (c % 2) == 1 ) {
      median = a[ int(c/2) ];
    } else {
      median = ( a[c/2] + a[c/2-1] ) / 2;
    };;
    OFS="\t";
    stdev=sqrt(sumsq/c - (sum/c)**2);
    min=a[1]
    max=a[c-1]
    print sum, c, ave, sqrt(sumsq/c - (sum/c)**2), median, a[1] ,a[c-1] #outputs Total Coverage at all bases, total bases, mean, stdev,  median, min cov, max coverage
  }')

echo ${i} $ONE

} >> ~/admixture_mapping/summary_files/coverage.CB-4.txt

done
