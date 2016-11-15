#!/bin/bash -l

cd ~/admixture_mapping/variants/bimbam/

for i in $(ls *pos.txt | uniq); do

	cat ${i} | awk 'BEGIN{OFS=" "}{print $1, int($2/2)}' > ${i}.1
	echo ${i}
done
