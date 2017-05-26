#############################################################################
#############################################################################
############################ fst outliers ###################################
#############################################################################
#############################################################################

#library(mscr)
library(qqman)
library(ggplot2)
##############
##############
############## pi measures
##############
##############

################ pp vs pl ########
#find 99% cutoff
pp.pl <- read.table("~/admixture_mapping/analysis/fst/PP_vs_PL.weir.fst", header=TRUE)
colnames(pp.pl) <- c("CHR", "BP", "fst")
pp.pl <-pp.pl[order(pp.pl$CHR),]
pp.pl$fst.1 <- pp.pl$fst
pp.pl$fst.1[which(pp.pl$fst.1 < 0)] <- c(0)
#pp.pl$fst.1[is.nan(pp.pl$fst.1)] <- c(0)
pp.pl$snp <- paste(pp.pl$CHR, pp.pl$BP, sep=":")

pp.pl.out <- data.frame(
				Chr = pp.pl$CHR,
				BP  = pp.pl$BP,
				SNP = pp.pl$snp,
				fst = pp.pl$fst.1)
write.table(pp.pl.out, "~/admixture_mapping/analysis/fst/fst_pp.pl.txt", row.names=FALSE, quote=FALSE)

pp.pl$CHR <- (gsub("chr", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("NW_0", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("\\.1", "",pp.pl$CHR))
pp.pl$CHR <- as.numeric(pp.pl$CHR)

quant <- quantile(pp.pl$fst.1,c(0.95, 0.99), na.rm=TRUE)

# plot snp by snp fst

png("~/admixture_mapping/figures/pp-pl_fst.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
abline(h=quant[2], col='red')

#Do loess regression
chroms <- unique(d$CHR)
for(chr in chroms[1:24]){
    len <- which(d$CHR == chr)
    lr <- loess(d$P[len] ~ d$pos[len]) 
    pos <- d$pos[len]
    pos.1 <- pos[!is.na(d$P[len])] 
    lines(x=pos.1, y=lr$fitted, col="red", lwd=1.5)
}
    
dev.off()


############## Identify outliers

outlie <- which(pp.pl$fst.1 > quant[2])
pp.pl$outliers <- c("F")
pp.pl$outliers[outlie] <- c("T")
outs<-subset(pp.pl,pp.pl$outliers=="T")

write.table(file="~/admixture_mapping/analysis/fst/pp-pl.outliers.bed",cbind(outs$CHR,(outs$BP-1),outs$BP),sep="\t",quote=F,row.names=F,col.names=F)
#merge adjoining outlier windows
merged <- read.table("~/admixture_mapping/analysis/fst/pp-pl.outliers.bed", header=F)
#qu is a cutoff, if I want to remove those below a value, buff is how far to look when joining windows
merged.win <-mergewin(win=merged, stat = outs$fst, qu= quant[2], tails="greater", buff=20000)
mean(merged.win$length)
median(merged.win$length)

min(merged.win$length)
max(merged.win$length)
merged.win[(which((merged.win$length) == max(merged.win$length))),]

#add back in NW_, .1, and chr

for (i in 1:24) {
	merged.win$chrom[which(merged.win$chrom == i)] <- paste("chr",i, sep="")
}
merged.win$chrom[which(merged.win$chrom != "chr[0-9]")
merged.win$chrom[!grepl("chr[0-9]",merged.win$chrom)] <- paste("NW_0", merged.win$chrom[!grepl("chr[0-9]",merged.win$chrom)], ".1", sep="")

write.table(merged.win,"~/admixture_mapping/analysis/fst/pp-pl.merged.win",sep="\t",quote=F,row.names=F,col.names=F)
write.table(merged.win[,1:3],"~/admixture_mapping/analysis/fst/pp-pl.merged.bed",
	sep="\t",quote=F,row.names=F,col.names=F)


############## From stacks, smoothed

pp.pl <- read.table("~/admixture_mapping/analysis/pi/all.chrom.fst_PL-PP.tsv", header=FALSE)
#header.name <- read.table("~/admixture_mapping/analysis/pi/all.chrom.fst_PL-PP.tsv", comment.char = "", 
		nrow=1, header=TRUE, sep='\t')
names(pp.pl) <- c("batch_id", "locus_id", "pop1", "pop2", "CHR", "BP","col", "pi", "fst", "FET", "odds", "CI_h",
					"CI-l", "LOD", "fst_corrected", "Fst_smooth", "Fst_amova", "Fst_amova_corrected",
					"fst_amova_smooth", "fst_amova_smooth_p", "window_snp_cnt" ) 

pp.pl <-pp.pl[order(pp.pl$CHR),]
pp.pl$CHR <- (gsub("chr", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("NW_0", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("\\.1", "",pp.pl$CHR))
pp.pl$CHR <- as.numeric(pp.pl$CHR)
quant <- quantile(pp.pl$fst, c(0.95, 0.99), na.rm=TRUE)

png("~/admixture_mapping/figures/pp-pl_fst_stacks.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL- stacks", p="fst", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
abline(h=quant[2], col='red')
dev.off()

quant <- quantile(pp.pl$Fst_smooth, c(0.95, 0.99), na.rm=TRUE)

png("~/admixture_mapping/figures/pp-pl_fst_stacks_smooth.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst- PP vs. PL- stacks- smoothed", p="Fst_smooth", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
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




#########
#################### pc vs hp ########  
#########

hp.pc <- read.table("~/admixture_mapping/analysis/fst/HP_vs_PC.weir.fst", header=TRUE)
colnames(hp.pc) <- c("CHR", "BP", "fst")
hp.pc <-hp.pc[order(hp.pc$CHR),]
hp.pc$fst.1 <- hp.pc$fst
hp.pc$fst.1[which(hp.pc$fst.1 < 0)] <- c(0)
#hp.pc$fst.1[is.nan(hp.pc$fst.1)] <- c(0)
hp.pc$snp <- paste(hp.pc$CHR, hp.pc$BP, sep=":")

hp.pc.out <- data.frame(
				Chr = hp.pc$CHR,
				BP  = hp.pc$BP,
				SNP = hp.pc$snp,
				fst = hp.pc$fst.1)

write.table(hp.pc.out, "~/admixture_mapping/analysis/outliers/fst_hp.pc.txt", row.names=FALSE, quote=FALSE)

hp.pc$CHR <- (gsub("chr", "", hp.pc$CHR))
hp.pc$CHR <- (gsub("NW_0", "",hp.pc$CHR))
hp.pc$CHR <- (gsub("\\.1", "",hp.pc$CHR))
hp.pc$CHR <- as.numeric(hp.pc$CHR)

#find 99% cutoff
quant <- quantile(hp.pc$fst.1,c(0.95, 0.99), na.rm=TRUE)

png("~/admixture_mapping/figures/pc-hp_fst.png", h=1000, w=1700, pointsize=20)
manhattan(hp.pc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Fst-PC vs. HP", p="fst.1", logp=FALSE, ylab="Fst", ylim=c(0,1.1))
abline(h=quant[2], col='red')
dev.off()

# identify outliers 
outlie <- which(hp.pc$fst.1 > quant[2])
hp.pc$outliers <- c("F")
hp.pc$outliers[outlie] <- c("T")
outs<-subset(hp.pc,hp.pc$outliers=="T")

write.table(file="~/admixture_mapping/analysis/fst/hp-pc.outliers.bed",cbind(outs$CHR,(outs$BP-1),outs$BP),sep="\t",quote=F,row.names=F,col.names=F)

#merge adjoining outlier windows
#library(mscr)
merged <- read.table("~/admixture_mapping/analysis/fst/pc-hp.outliers.bed", header=F)
#qu is a cutoff, if I want to remove those below a value, buff is how far to look when joining windows
merged.win <-mergewin(win=merged, stat = outs$fst, qu= quant[2], tails="greater", buff=20000)
mean(merged.win$length)
min(merged.win$end - merged.win$start)
max(merged.win$end - merged.win$start)
merged.win[(which((merged.win$end - merged.win$start) == max(merged.win$end - merged.win$start))),]

#add back in NW_, .1, and chr

for (i in 1:24) {
	merged.win$chrom[which(merged.win$chrom == i)] <- paste("chr",i, sep="")
}

merged.win$chrom[!grepl("chr[0-9]",merged.win$chrom)] <- paste("NW_0", merged.win$chrom[!grepl("chr[0-9]",merged.win$chrom)], ".1", sep="")

write.table(merged.win,"~/admixture_mapping/analysis/fst/hp-pc.merged.win",sep="\t",quote=F,row.names=F,col.names=F)
write.table(merged.win[,1:3],"~/admixture_mapping/analysis/fst/hp-pc.merged.bed",
	sep="\t",quote=F,row.names=F,col.names=F)





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
