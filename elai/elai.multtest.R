#Read in combined ancestry assignment files
snp_files <- list.files(pattern = "BC.*.5.100.snpinfo.txt") #these files are all identical, so ok that it is from BC
names(snp_files) <- matrix(unlist(strsplit(snp_files, "\\.")), ncol=6, byrow=TRUE)[,2]
snp_list <- lapply(snp_files, read.table, header=TRUE)
filelist <-  list.files(pattern = "all.*.combined.txt") # file list of local ancestry assingments
names(filelist) <- matrix(unlist(strsplit(filelist, "\\.")), ncol=4, byrow=TRUE)[,2]
data_list <- lapply(filelist, scan) #read in local assignments into a list
specify_decimal <- function(x, k) format(round(x, k), nsmall=k) 
#reformat data into allele 1 and 2, by snp, then by indiv. A list with 565 entries, where each column is a snp
nams <- names(data_list)
for (i in 1:length(filelist)){
	snp.name <- snp_list[[nams[i]]]
	dim(data_list[[nams[i]]])=c(2, nrow(snp.name), 565);
}
#can look at hybrid index from admixture (ancest), and elai (yy)
new <- (matrix(unlist(yy[2,,]), ncol=length(yy[2,,1]), byrow=TRUE))
out <- c()
for (i in 1:nrow(new)){
	out[i] <- 1-(mean(new[i,])/2)
}

#look for agreement between the measures
summary(lm(out ~ ancest$V3[1:length(out)]))

##### Calculate spectral density at frequency zero, to determine number of tests for multiple testing
library(coda)

est <- data.frame(matrix(nrow=dim(data_list[[1]])[3], ncol=24))
colnames(est) <- names(data_list)

for (chr in names(data_list)){
	dat <- data_list[[chr]]
	for (i in 1:nrow(est)){
		spectrum <- spectrum0.ar(dat[1,,i])
		est[[chr]][i] <- spectrum$spec
	}
}

sum((apply(est, 2, (sum)))/565
