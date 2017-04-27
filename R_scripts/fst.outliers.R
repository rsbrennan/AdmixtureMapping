#############################################################################
#############################################################################
############################ fst outliers ###################################
#############################################################################
#############################################################################

library(mscr)

################ pp vs pl ########
#find 99% cutoff
pp.pl <- data_list$PP_vs_PL.weir.fst
#pp.pl$SNP <- paste(pp.pl$CHR, pp.pl$BP, sep=":")
pp.pl$CHR <- as.numeric((gsub("chr", "",pp.pl$CHR)))
quant <- quantile(pp.pl$fst.1,c(0.95, 0.99), na.rm=TRUE)

# plot snp by snp fst

png("~/admixture_mapping/figures/pp-pl_fst.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
abline(h=quant[2], col='red')
dev.off()

# plot window fst

pp.pl.win <- read.table("PP_vs_PL.windowed.weir.fst", header=TRUE)
pp.pl.win$fst <- pp.pl.win$WEIGHTED_FST
pp.pl.win$fst[which(pp.pl.win$fst < 0)] <- c(0)
quant <- quantile(pp.pl.win$fst,c(0.95, 0.99), na.rm=TRUE)
#pp.pl.win$CHROM <- gsub("chr", "", pp.pl.win$CHROM)
colnames(pp.pl.win) <- c("CHR","BP", "END", "N_VARIANTS", 
							"WEIGHTED_FST", "MEAN_FST", "fst" )
pp.pl.win$CHR <- as.numeric(pp.pl.win$CHR)

png("~/admixture_mapping/figures/pp-pl_fst_window.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl.win , suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst-150kb windows- PP vs. PL", p="fst", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
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

# write bed file for use with sliding window analysis:
write.table(file="pp.pl.fst.bed",cbind(pp.pl$CHR,(pp.pl$BP-1),pp.pl$BP, pp.pl$fst.1),
	sep="\t",quote=F,row.names=F,col.names=F)





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

