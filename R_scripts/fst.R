library(qqman)
library(corrplot)

setwd("~/admixture_mapping/analysis/fst")
filelist = list.files(pattern = ".*weir.fst")

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


#############################################################################
#############################################################################
############################ fst outliers ###################################
#############################################################################
#############################################################################

library(mscr)

################ pp vs pl ########
#find 99% cutoff
pp.pl <- data_list$PP_vs_PL.weir.fst
pp.pl$SNP <- paste(pp.pl$CHR, pp.pl$BP, sep=":")
pp.pl$CHR <- as.numeric((gsub("chr", "",pp.pl$CHR)))
quant <- quantile(pp.pl$fst.1,c(0.95, 0.99), na.rm=TRUE)

png("pp-pl_fst.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1), highlight=SNP)
abline(h=quant[2], col='red')
dev.off()

outlie <- which(pp.pl$fst.1 > quant[2])
pp.pl$outliers <- c("F")
pp.pl$outliers[outlie] <- c("T")
outs<-subset(pp.pl,pp.pl$outliers=="T")

write.table(file="pp-pl.outliers.bed",cbind(outs$CHR,(outs$BP-1),outs$BP),sep="\t",quote=F,row.names=F,col.names=F)

#merge adjoining outlier windows
merged <- read.table("pp-pl.outliers.bed", header=F)
#qu is a cutoff, if I want to remove those below a value, buff is how far to look when joining windows
merged.win <-mergewin(win=merged, stat = outs$fst, qu= quant[2], tails="greater", buff=25000)
mean(merged.win$end - merged.win$start)
min(merged.win$end - merged.win$start)
max(merged.win$end - merged.win$start)
merged.win[(which((merged.win$end - merged.win$start) == max(merged.win$end - merged.win$start))),]

write.table(merged.win,"pp-pl.merged.win",sep="\t",quote=F,row.names=F,col.names=F)


#################### pc vs hp ########  
pc.hp <- data_list$PC_vs_HP.weir.fst
pc.hp$SNP <- paste(pc.hp$CHR, pc.hp$BP, sep=":")
pc.hp$CHR <- as.numeric((gsub("chr", "",pc.hp$CHR)))
#find 99% cutoff
quant <- quantile(pc.hp$fst.1,c(0.95, 0.99), na.rm=TRUE)

png("pc-hp_fst.png", h=1000, w=1700, pointsize=20)
manhattan(pc.hp, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst-PC vs. HP", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1), highlight = snp)
abline(h=quant[2], col='red')
dev.off()

# identify outliers 
outlie <- which(pc.hp$fst.1 > quant[2])
pc.hp$outliers <- c("F")
pc.hp$outliers[outlie] <- c("T")
outs<-subset(pc.hp,pc.hp$outliers=="T")

write.table(file="pc-hp.outliers.bed",cbind(outs$CHR,(outs$BP-1),outs$BP),sep="\t",quote=F,row.names=F,col.names=F)

#merge adjoining outlier windows
library(mscr)
merged <- read.table("pc-hp.outliers.bed", header=F)
#qu is a cutoff, if I want to remove those below a value, buff is how far to look when joining windows
merged.win <-mergewin(win=merged, stat = outs$fst, qu= quant[2], tails="greater", buff=25000)
mean(merged.win$end - merged.win$start)
min(merged.win$end - merged.win$start)
max(merged.win$end - merged.win$start)
merged.win[(which((merged.win$end - merged.win$start) == max(merged.win$end - merged.win$start))),]

write.table(merged.win,"pc-hp.merged.win",sep="\t",quote=F,row.names=F,col.names=F)

################# pp vs pc ########

pp.pc <- data_list$PP_vs_PC.weir.fst
pp.pc$SNP <- paste(pp.pc$CHR, pp.pc$BP, sep=":")
pp.pc$CHR <- as.numeric((gsub("chr", "",pp.pc$CHR)))
#find 99% cutoff
quant <- quantile(pp.pc$fst.1,c(0.95, 0.99), na.rm=TRUE)

png("pp.pc_fst.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst-PP vs. PC", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1), highlight = SNP)
abline(h=quant[2], col='red')
dev.off()

# identify outliers 
outlie <- which(pp.pc$fst.1 > quant[2])
pp.pc$outliers <- c("F")
pp.pc$outliers[outlie] <- c("T")
outs<-subset(pp.pc,pp.pc$outliers=="T")

write.table(file="pp-pc.outliers.bed",cbind(outs$CHR,(outs$BP-1),outs$BP),sep="\t",quote=F,row.names=F,col.names=F)

#merge adjoining outlier windows
library(mscr)
merged <- read.table("pp-pc.outliers.bed", header=F)
#qu is a cutoff, if I want to remove those below a value, buff is how far to look when joining windows
merged.win <-mergewin(win=merged, stat = outs$fst, qu= quant[2], tails="greater", buff=25000)
mean(merged.win$end - merged.win$start)
min(merged.win$end - merged.win$start)
max(merged.win$end - merged.win$start)
merged.win[(which((merged.win$end - merged.win$start) == max(merged.win$end - merged.win$start))),]

write.table(merged.win,"pp-pc.merged.win",sep="\t",quote=F,row.names=F,col.names=F)


#############################################################################
#############################################################################
######################### overlap between bayescan and emp.##################
#############################################################################
#############################################################################
pp.pl <- data_list$PP_vs_PL.weir.fst
pp.pl$SNP <- paste(pp.pl$CHR, pp.pl$BP, sep=":")
pp.pl$CHR <- as.numeric((gsub("chr", "",pp.pl$CHR)))
quant <- quantile(pp.pl$fst.1,c(0.95, 0.99), na.rm=TRUE)
pp.pl.bs <-read.table("~/admixture_mapping/analysis/bayescan/pp-pl.bayescan.bed")
tohighlight <- paste(pp.pl.bs$V1, pp.pl.bs$V3, sep=":")

manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1), highlight=tohighlight)
abline(h=quant[2], col='red')















