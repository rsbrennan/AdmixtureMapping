
#files in ~/admixture_mapping/results/pca/

##
## all samples included. likely to be skewed because of unequal sampling between pops

dat <- read.table("~/admixture_mapping/analysis/pca/pcs.all.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.all.txt")
labels <- read.table("~/admixture_mapping/variants/all.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("purple", "green", "black", "yellow" , "orange", "red", "blue", "pink")
png("~/admixture_mapping/results/PCA_PC1_PC2_allindivs.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC1, y=dat$PC2, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="PCA: PC1 vs PC2 for all indivs", 
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_allindivs.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3 for all indivs" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

##
## admixed indivs removed. should fix skew
##

dat <- read.table("~/admixture_mapping/analysis/pca/pcs.noadmix.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.noadmix.txt")
labels <- read.table("~/admixture_mapping/variants/noadmix.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("black", "yellow" , "orange", "red", "blue", "pink")
png("~/admixture_mapping/results/PCA_PC1_PC2_noadmix.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC1, y=dat$PC2, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="PCA: PC1 vs PC2 no admixed indivs", 
	cex=1.6,
	pch=19)
legend(x="bottomleft", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_noadmix.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3 no admixed indivs" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19, cex=1.7)
dev.off()

##
## all populations, subsample admixed populations
##

dat <- read.table("~/admixture_mapping/analysis/pca/pcs.all.subsamp.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.all.subsamp.txt")
labels <- read.table("~/admixture_mapping/variants/all.subsamp.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("purple", "green", "black", "yellow" , "orange", "red", "blue", "pink")
png("~/admixture_mapping/results/PCA_PC1_PC2_all.subsamp.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC1, y=dat$PC2, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="PCA: PC1 vs PC2 all pops, admixed subsampled", 
	cex=1.6,
	pch=19)
legend(x="bottomleft", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_all.subsamp.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3 all pops, admixed subsample" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19, cex=1.7)
dev.off()

##
## removing GA and NH samples
##


dat <- read.table("~/admixture_mapping/analysis/pca/pcs.N_S.remove.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.N_S.remove.txt")
labels <- read.table("~/admixture_mapping/variants/N_S.remove.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("purple", "green", "yellow" , "orange", "red", "blue")
png("~/admixture_mapping/results/PCA_PC1_PC2_N_S.remove.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC1, y=dat$PC2, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="PCA: PC1 vs PC2; GA & NH rm", 
	cex=1.6,
	pch=19)
legend(x="bottomleft", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_N_S.remove.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3; GA & NH rm" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()



##
## removing GA and NH samples, subsample admixed indivs. 
##

dat <- read.table("~/admixture_mapping/analysis/pca/pcs.N_S.remove.subsamp.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.N_S.remove.subsamp.txt")
labels <- read.table("~/admixture_mapping/variants/N_S.remove.subsamp.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("purple", "green", "yellow" , "orange", "red", "blue")
png("~/admixture_mapping/results/PCA_PC1_PC2_N_S.remove.subsamp.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC1, y=dat$PC2, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="PCA: PC1 vs PC2; GA & NH rm, Admix thinned", 
	cex=1.6,
	pch=19)
legend(x="bottomleft", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_N_S.remove.subsamp.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3; GA & NH rm, Admix thinned" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()


##
## CB only
##

dat <- read.table("~/admixture_mapping/analysis/pca/pcs.CB.txt", header=FALSE)
var <- read.table("~/admixture_mapping/analysis/pca/pve.CB.txt")
labels <- read.table("~/admixture_mapping/variants/CB.thinned.fam", header=FALSE)
dat <- cbind (labels$V1, dat)
dat <- cbind (substr(labels$V1, 1,2), dat)
colnames(dat) <- c("pop", "indiv", "PC1", "PC2", "PC3", "PC4","PC5", "PC6", "PC7", "PC8", "PC9", "PC10")

col.plot <- c("purple", "blue", "red")
png("~/admixture_mapping/figures/PCA_PC1_PC2_CB.png", h=1000, w=1000, pointsize=20)
par(mar = c(4, 5, 1, 1), oma = c(1, 1, 1, 1))
plot(x=dat$PC1, y=dat$PC2, 
	bg=col.plot[dat$pop], 
	xlab="PC1",
	ylab="PC2",
#	xlab=paste("PC-1: ", round((var$V1[1]*100), 1), "%", sep=""), 
#	ylab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""),
	main="", 
	cex=2,
	pch=21,
	cex.axis=1.5, cex.lab=1.5,)
legend(x="topleft", legend = c("admixed", "BW-native", "FW-native"), 
	col=col.plot, pch=19, cex=1.6)
dev.off()

png("~/admixture_mapping/results/PCA_PC2_PC3_N_S.remove.subsamp.png", h=1000, w=1000, pointsize=20)
plot(x=dat$PC2, y=dat$PC3, 
	col=col.plot[dat$pop], 
	xlab=paste("PC-2: ", round((var$V1[2]*100), 1), "%", sep=""), 
	ylab=paste("PC-3: ", round((var$V1[3]*100), 1), "%", sep=""),
	main="PCA: PC2 vs PC3; GA & NH rm, Admix thinned" ,
	cex=1.6,
	pch=19)
legend(x="bottomright", legend = levels(dat$pop), col=col.plot, pch=19)
dev.off()



