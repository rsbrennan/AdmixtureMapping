
#############
############# use local ancestry to make bimbam file ###############
#############
setwd("~/admixture_mapping/analysis/elai/output/")

####### AF alone ##########

snp_files <- list.files(pattern = "AF.*.5.100.snpinfo.txt")
names(snp_files) <- matrix(unlist(strsplit(snp_files, "\\.")), ncol=6, byrow=TRUE)[,2]
snp_list <- lapply(snp_files, read.table, header=TRUE)
filelist <-  list.files(pattern = "AF.*.combined.txt") # file list of local ancestry assingments
names(filelist) <- matrix(unlist(strsplit(filelist, "\\.")), ncol=4, byrow=TRUE)[,2]
data_list <- lapply(filelist, scan) #read in local assignments into a list
specify_decimal <- function(x, k) format(round(x, k), nsmall=k) 
#reformat data into allele 1 and 2, by snp, then by indiv. A list with 565 entries, where each column is a snp
nams <- names(data_list)
for (i in 1:length(filelist)){
	snp.name <- snp_list[[nams[i]]]
	dim(data_list[[nams[i]]])=c(2, nrow(snp.name), 248);
}
data_list <- lapply(data_list, function(x) specify_decimal(x, 2))# force all nums to 2 decimal places
#reorder chromosomes
chr.order <- c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18","chr19", "chr20","chr21","chr22","chr23","chr24")
pop_list <-data_list[chr.order]
pop_snp <-snp_list[chr.order]
nams <- names(pop_list)
snp.num <- 0
for (i in 1:length(names(pop_list))){
	snp.num <- snp.num + dim(pop_list[[i]])[2]
}

#create empty matrix to fill
pop_list.1 <- matrix( ncol=dim(pop_list[[1]])[3])
#fill matrix
for (i in 1:(length(nams))){
	pop_list.1 <- rbind(pop_list.1, data_list[[i]][2,,])
}
#remove first row of NA and turn to data frame
pop_list.1 <- as.data.frame(pop_list.1[-1,])

labels <- as.data.frame(matrix( ncol=3))
for (i in 1:(length(nams))){
	within <- cbind(as.character(pop_snp[[i]]$rs), 
		as.character(pop_snp[[i]]$minor),
		as.character(pop_snp[[i]]$major))
	labels <- rbind(labels, within)
}
labels.1 <- as.data.frame(labels[-1,])

pop_out <- cbind(labels.1, pop_list.1)


write.table(pop_out, "~/admixture_mapping/analysis/gwas/af.local.gemma", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")

####### BC alone ##########

snp_files <- list.files(pattern = "BC.*.5.100.snpinfo.txt") #these files are all identical, so ok that it is from BC
names(snp_files) <- matrix(unlist(strsplit(snp_files, "\\.")), ncol=6, byrow=TRUE)[,2]
snp_list <- lapply(snp_files, read.table, header=TRUE)
filelist <-  list.files(pattern = "BC.*.combined.txt") # file list of local ancestry assingments
names(filelist) <- matrix(unlist(strsplit(filelist, "\\.")), ncol=4, byrow=TRUE)[,2]
data_list <- lapply(filelist, scan) #read in local assignments into a list
specify_decimal <- function(x, k) format(round(x, k), nsmall=k) 
#reformat data into allele 1 and 2, by snp, then by indiv. A list with 565 entries, where each column is a snp
nams <- names(data_list)
for (i in 1:length(filelist)){
	snp.name <- snp_list[[nams[i]]]
	dim(data_list[[nams[i]]])=c(2, nrow(snp.name), 317);
}
data_list <- lapply(data_list, function(x) specify_decimal(x, 2))# force all nums to 2 decimal places
#reorder chromosomes
chr.order <- c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18","chr19", "chr20","chr21","chr22","chr23","chr24")
pop_list <-data_list[chr.order]
pop_snp <-snp_list[chr.order]
nams <- names(pop_list)
snp.num <- 0
for (i in 1:length(names(pop_list))){
	snp.num <- snp.num + dim(pop_list[[i]])[2]
}

#create empty matrix to fill
pop_list.1 <- matrix( ncol=dim(pop_list[[1]])[3])
#fill matrix
for (i in 1:(length(nams))){
	pop_list.1 <- rbind(pop_list.1, data_list[[i]][2,,])
}
#remove first row of NA and turn to data frame
pop_list.1 <- as.data.frame(pop_list.1[-1,])

labels <- as.data.frame(matrix( ncol=3))
for (i in 1:(length(nams))){
	within <- cbind(as.character(pop_snp[[i]]$rs), 
		as.character(pop_snp[[i]]$minor),
		as.character(pop_snp[[i]]$major))
	labels <- rbind(labels, within)
}
labels.1 <- as.data.frame(labels[-1,])

pop_out <- cbind(labels.1, pop_list.1)


write.table(pop_out, "~/admixture_mapping/analysis/gwas/bc.local.gemma", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")

####### AF+BC  ##########

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
data_list <- lapply(data_list, function(x) specify_decimal(x, 2))# force all nums to 2 decimal places
#reorder chromosomes
chr.order <- c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18","chr19", "chr20","chr21","chr22","chr23","chr24")
pop_list <-data_list[chr.order]
pop_snp <-snp_list[chr.order]
nams <- names(pop_list)
snp.num <- 0
for (i in 1:length(names(pop_list))){
	snp.num <- snp.num + dim(pop_list[[i]])[2]
}

#create empty matrix to fill
pop_list.1 <- matrix( ncol=dim(pop_list[[1]])[3])
#fill matrix
for (i in 1:(length(nams))){
	pop_list.1 <- rbind(pop_list.1, data_list[[i]][2,,])
}
#remove first row of NA and turn to data frame
pop_list.1 <- as.data.frame(pop_list.1[-1,])

labels <- as.data.frame(matrix( ncol=3))
for (i in 1:(length(nams))){
	within <- cbind(as.character(pop_snp[[i]]$rs), 
		as.character(pop_snp[[i]]$minor),
		as.character(pop_snp[[i]]$major))
	labels <- rbind(labels, within)
}
labels.1 <- as.data.frame(labels[-1,])

pop_out <- cbind(labels.1, pop_list.1)


write.table(pop_out, "~/admixture_mapping/analysis/gwas/af.bc.local.gemma", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")

