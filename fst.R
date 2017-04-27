library(qqman)
library(corrplot)

setwd("~/admixture_mapping/analysis/fst")
filelist = list.files(pattern = "*_vs_[A-Z][A-Z].weir.fst")

#assuming tab separated values with a header     
data_list = lapply(filelist, read.table, header=TRUE)

names(data_list)<-filelist
colnames <- c("CHR", "BP", "fst")
data_list <- lapply(data_list, setNames, colnames)

#remove chr from chromosome col
for (i in 1:length(data_list)){
	data_list[[i]]$CHR <- ((gsub("chr", "",data_list[[i]]$CHR)))
}
#assign negative fst values 0
for (i in 1:length(data_list)){
	data_list[[i]]$fst.1 <- data_list[[i]]$fst
	data_list[[i]]$fst.1[which(data_list[[i]]$fst.1 < 0)] <- c(0)
}

#calculate mean fst, fst.1
fst <- sapply(data_list, function(x) mean(x$fst, na.rm=TRUE))
fst.1 <- sapply(data_list, function(x) mean(x$fst.1, na.rm=TRUE))
#need to make matrix of fst values for corrplot
names(fst.1) <- gsub(".weir.fst", "", names(fst.1))
name <- unique(gsub("_vs_..", "",names(fst.1)))
values <- as.data.frame(matrix(nrow=8, ncol=8))
rownames(values) <- name
colnames(values) <- name
for (i in names(fst.1)){
	pop1 <- substr(i, 1, 2)
	pop2 <- substr(i, 7, 8)
	col <- which( colnames(values) == pop1 )
	row <- which( rownames(values) == pop2 )
	values[row,col]<- fst.1[i]
	col <- which( colnames(values) == pop2 )
	row <- which( rownames(values) == pop1 )
	values[row,col]<- fst.1[i]
}
values[is.na(values)] <- 0
values <- sapply(values, round, 2)
rownames(values) <- name
values.2 <- values[,c("PP", "AF", "PL", "GA", "HP","BC", "PC", "TR")]
values.2 <- values.2[c("PP", "AF", "PL", "GA", "HP","BC", "PC", "TR"),]

png("fst.corr.png", h=1000, w=1000, pointsize=20)
corrplot(values.2, method="color", type="upper",cl.lim=c(0,max(values)),
	col=colorRampPalette(c("red","white","blue"))(200),
	is.corr=FALSE, addCoef.col="black",
	tl.col="black", cl.pos ="n",
	diag=FALSE, tl.cex = 1.5,tl.srt=45)
dev.off()

#### remove ga and tr pops
remove <- c(5, 7, 8,9,10,11, 14, 16, 22, 25, 29, 30)
name.remove <- names(fst.1)[-c(5, 7, 8,9,10,11, 14, 16, 22, 25, 29, 30)]
values <- as.data.frame(matrix(nrow=6, ncol=6))
rownames(values) <- name[-c(3,8)]
colnames(values) <- name[-c(3,8)]
for (i in name.remove){
	pop1 <- substr(i, 1, 2)
	pop2 <- substr(i, 7, 8)
	col <- which( colnames(values) == pop1 )
	row <- which( rownames(values) == pop2 )
	values[row,col]<- fst.1[i]
	col <- which( colnames(values) == pop2 )
	row <- which( rownames(values) == pop1 )
	values[row,col]<- fst.1[i]
}
values[is.na(values)] <- 0
values <- sapply(values, round, 2)
rownames(values) <- name[-c(3,8)]
values.2 <- values[,c("PP", "AF", "PL", "HP","BC", "PC")]
values.2 <- values.2[c("PP", "AF", "PL", "HP","BC", "PC"),]

png("fst.corr.N_S.remove.png", h=1000, w=1000, pointsize=20)
corrplot(values.2, method="color", type="upper",cl.lim=c(0,max(values)),
	col=colorRampPalette(c("red","white","blue"))(200),
	is.corr=FALSE, addCoef.col="black",
	tl.col="black", cl.pos ="n",
	diag=FALSE, tl.cex = 1.5,tl.srt=45)
dev.off()













