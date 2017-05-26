#genetic map
#/home/jmiller1/bin/code/ALLMAPS_OUT/MF.Map/unsplit_merge.agp
#this is an agp file. For orientation, ? is treated as +
#can ignore the U rows.

#file on cluster
dat <- read.table("/home/jmiller1/bin/code/ALLMAPS_OUT/MF.Map/unsplit_merge.agp", header=FALSE, fill=TRUE)
dat <- dat[(grepl("W", dat[,5])),]

#CHECK TO MAKE SURE THAT THE GAPS ARE INCLUDED BELOW!!!!!!!!

#list of scaffold with base position corrected
ref <- data.frame(scaff=dat[,6], chrm=dat[,1], length=dat[,8], start=dat$V2, end=dat$V3, rev= dat[,9])
ref$rev <- gsub('?', '+', ref$rev, fixed=TRUE)

########  renaming vcf

#need to make sure scaffold names have been converted.

library(data.table)

vcf <- fread("zcat ~/admixture_mapping/variants/all.vcf.gz| grep -v '^#'", header=FALSE, showProgress=TRUE)

vcf <- as.data.frame(vcf)
vcf1 <- vcf

# change scaffolds to chromosomes
# use ref data for comparison

for (i in 1:length(ref$scaff)){
	match <- which( vcf$V1 == ref$scaff[i]) 
	if (length(match) > 0){
		for (mat in 1:length(match)){
			vcf$V1[match[mat]] <- as.character(ref$chrm[i])
			if (ref$rev[i] == "+" ){
				new <- ref$start[i] + vcf[match[mat], 2] -1
				vcf$V2[match[mat]] <- new
				}
		
			else{
				new <- (ref$end[i] - vcf[match[mat], 2] + 1)
				vcf$V2[match[mat]] <- new
				}
			}
		}
	print(i)	
	}

write.table(vcf, "~/admixture_mapping/variants/all.chrom.vcf", col.names=FALSE, row.names=FALSE, quote=FALSE)


