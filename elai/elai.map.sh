#!/bin/bash -l

cd ~/admixture_mapping/variants/bimbam/

for i in $(ls *pos.txt | uniq); do

	cat ${i} | awk -vOFMT=%10.6f  'BEGIN{OFS=" "}{print $1, $2*0.4}' | \
		awk 'BEGIN{OFS=FS=" "}{$2=sprintf("%3.0f",$2)}1' > ${i}.1
	echo ${i}
done
