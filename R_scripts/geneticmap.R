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


#write.table(vcf, "~/admixture_mapping/variants/cb-all.70.chrom.split.vcf", col.names=FALSE, row.names=FALSE, quote=FALSE)
write.table(vcf, "~/admixture_mapping/variants/all.chrom.vcf", col.names=FALSE, row.names=FALSE, quote=FALSE)



############# Write function to outpur coordinates from scaff to chrom and opposite
####### This isn't done !!!!!!

coord.convert <- function(number, bp, type){
	#make sure to specity type as "scaffold" or "chrom", with quotes included
	#number should be in format of "Scaffold###" or "chr#"
	if (type == "scaffold"){
		match <- which(ref$scaff == number)
		if (ref$rev[match] > 0){
			out <- ref$start[match] + bp
			out.1 <- ref$chrm[match]
			final <- paste(out.1, out, sep=" ")
		}
		if (ref$rev[match] < 0){
			out <- (ref$end[match]- bp) + 1
			out.1 <- ref$chrm[match]
			final <- paste(out.1, out, sep=" ")
		}
	}
	if (type == "chrom"){
		match <- which(ref$chrm == number)
		match.1 <- which(bp >= ref$start[match] & bp <= ref$end[match])
		if (ref$rev[match.1] > 0){
			out <- ref$start[match.1] + bp
			out.1 <- ref$chrm[match.1]
			final <- paste(out.1, out, sep=" ")
		}
		if (ref$rev[match] < 0){
			out <- ref$start[match.1] + bp
			out.1 <- ref$chrm[match.1]
			final <- paste(out.1, out, sep=" ")

		}
	}

	return(final)
}


#### Fix GFF

#don's annotation

#convert to scaffold names



awk 'FNR==NR { a[$1]=$2; next } $1 in a { $1=a[$1] }1' \
~/reference/convert.scaff.name.ncbi.txt kfish2rae5h_fc17_subupd4.gff3 |\
tr ' ' '\t' | bgzip > kfish2rae5h_fc17_subupd4.gff3.gz

cat /home/jmiller1/bin/code/breakpoints.map_ncbi.bed
cat /home/jmiller1/bin/code/list.SPLIT.ncbi.contigs
NW_012224574.1.2
#convert the coordinates
~/bin/liftOver -gff kfish2rae5h_fc17_subupd4.gff3.gz /home/jmiller1/bin/code/merged_ncbi.chain kfish2rae5h_fc17_subupd4.chr.gff unmapped

#the problem: there are 9 split scaffolds- these need to be split in order for don's gff to work with liftover.
#the "unmapped" genes are thost that are on split scaffolds

This file lists the locations of the splits: list.SPLIT.ncbi.contigs.agp


