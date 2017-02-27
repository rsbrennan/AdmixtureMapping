

library(ggplot2)
library(reshape2)
library(scales)
library(gridExtra)

############ AC alone

dat2 <- read.table("~/admixture_mapping/results/chrom.AC.all.2.Q")
dat3 <- read.table("~/admixture_mapping/results/chrom.AC.all.3.Q")

id <- read.table("~/admixture_mapping/variants/chrom.AC.all.fam", header=FALSE)
labels <- substr(id$V2, 1,2)
labs <- data.frame(population = labels, Individual = id$V1)

dat2 <- cbind(labs, dat2)
dat3 <- cbind(labs, dat3)
colnames(dat2)<- c("population", "Individual", "P1", "P2")
colnames(dat3)<- c("population", "Individual", "P1", "P2", "P3")

all.list <- list(dat2=dat2, dat3=dat3)

for (i in 1:2){
	all.list[[i]]$ord <- c("NA")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PL")] <- c("3")
	all.list[[i]]$ord[which(all.list[[i]]$population == "AF")] <- c("2")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PP")] <- c("1")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PC")] <- c("4")
	all.list[[i]]$ord[which(all.list[[i]]$population == "BC")] <- c("5")
	all.list[[i]]$ord[which(all.list[[i]]$population == "HP")] <- c("6")
	all.list[[i]] <- all.list[[i]][order(all.list[[i]]$ord),]
	all.list[[i]]$num <- paste(all.list[[i]]$ord, all.list[[i]]$Individual, sep="-")
}

png("admixture.AC.png", width=700, height= 1000, units="px")

par(mfrow = c(2, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#k=2
pop<-all.list[["dat2"]][,1]
pop <- factor(pop, levels = c("PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat2"]][,3:4]),xaxt="n",col=c("blue", "red"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=2")

#k=3
pop<-all.list[["dat3"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat3"]][,3:5]),xaxt="n",col=c("blue", "red", "purple"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=3")
dev.off()

############
############
############
############ CB alone ###################

dat2 <- read.table("~/admixture_mapping/results/chrom.CB.all.2.Q")
dat3 <- read.table("~/admixture_mapping/results/chrom.CB.all.3.Q")

id <- read.table("~/admixture_mapping/variants/chrom.CB.all.fam", header=FALSE)
labels <- substr(id$V2, 1,2)
labs <- data.frame(population = labels, Individual = id$V1)
dat2 <- cbind(labs, dat2)
dat3 <- cbind(labs, dat3)
colnames(dat2)<- c("population", "Individual", "P1", "P2")
colnames(dat3)<- c("population", "Individual", "P1", "P2", "P3")

all.list <- list(dat2=dat2, dat3=dat3)

for (i in 1:2){
	all.list[[i]]$ord <- c("NA")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PL")] <- c("3")
	all.list[[i]]$ord[which(all.list[[i]]$population == "AF")] <- c("2")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PP")] <- c("1")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PC")] <- c("4")
	all.list[[i]]$ord[which(all.list[[i]]$population == "BC")] <- c("5")
	all.list[[i]]$ord[which(all.list[[i]]$population == "HP")] <- c("6")
	all.list[[i]] <- all.list[[i]][order(all.list[[i]]$ord),]
	all.list[[i]]$num <- paste(all.list[[i]]$ord, all.list[[i]]$Individual, sep="-")
}


png("admixture.CB.png", width=700, height= 1000, units="px")

par(mfrow = c(2, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#k=2
pop<-all.list[["dat2"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL")) 
h<-barplot(t(all.list[["dat2"]][,3:4]),xaxt="n",col=c("blue", "red"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=2")

#k=3
pop<-all.list[["dat3"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL")) 
h<-barplot(t(all.list[["dat3"]][,3:5]),xaxt="n",col=c("blue", "red", "purple"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=3")
dev.off()


############
############
############
############ CB+AC together- without GA and TR ###################
############## 

dat2 <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.2.Q")
dat3 <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.3.Q")
dat4 <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.4.Q")
dat5 <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.5.Q")
dat6 <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.6.Q")

id <- read.table("~/admixture_mapping/variants/N_S.remove.subsamp.fam", header=FALSE)
labels <- substr(id$V2, 1,2)
labs <- data.frame(population = labels, Individual = id$V1)

dat2 <- cbind(labs, dat2)
dat3 <- cbind(labs, dat3)
dat4 <- cbind(labs, dat4)
dat5 <- cbind(labs, dat5)
dat6 <- cbind(labs, dat6)

colnames(dat2)<- c("population", "Individual", "P1", "P2")
colnames(dat3)<- c("population", "Individual", "P1", "P2", "P3")
colnames(dat4)<- c("population", "Individual", "P1", "P2", "P3", "P4")
colnames(dat5)<- c("population", "Individual", "P1", "P2", "P3", "P4", "P5")
colnames(dat6)<- c("population", "Individual", "P1", "P2", "P3", "P4", "P5", "P6")

all.list <- list(dat2=dat2, dat3=dat3, dat4=dat4, dat5=dat5, dat6=dat6)

for (i in 1:5){
	all.list[[i]]$ord <- c("NA")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PL")] <- c("3")
	all.list[[i]]$ord[which(all.list[[i]]$population == "AF")] <- c("2")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PP")] <- c("1")
	all.list[[i]]$ord[which(all.list[[i]]$population == "PC")] <- c("4")
	all.list[[i]]$ord[which(all.list[[i]]$population == "BC")] <- c("5")
	all.list[[i]]$ord[which(all.list[[i]]$population == "HP")] <- c("6")
	all.list[[i]] <- all.list[[i]][order(all.list[[i]]$ord),]
	all.list[[i]]$num <- paste(all.list[[i]]$ord, all.list[[i]]$Individual, sep="-")
}

png("admixture.N_S.remove.subsamp.png", width=700, height= 1000, units="px")

par(mfrow = c(5, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#k=2
pop<-all.list[["dat2"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat2"]][,3:4]),xaxt="n",col=c("blue", "red"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=2")

#k=3
pop<-all.list[["dat3"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat3"]][,3:5]),xaxt="n",col=c("blue", "red", "purple"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=3")

#k=4
pop<-all.list[["dat4"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat4"]][,3:6]),xaxt="n",col=c("blue", "red", "purple", "green"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=4")

#k=5
pop<-all.list[["dat5"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat5"]][,3:7]),xaxt="n",col=c("blue", "red", "purple", "green", "orange"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=5")

#k=6
pop<-all.list[["dat6"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat6"]][,3:8]),xaxt="n",col=c("blue", "red", "purple", "green", "orange", "sienna"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=6")

#k=7
pop<-all.list[["dat7"]][,1]
pop <- factor(pop, levels = c("PP", "AF", "PL", "PC", "BC", "HP")) 
h<-barplot(t(all.list[["dat7"]][,3:9]),xaxt="n",col=c("blue", "red", "purple", "green", "orange", "sienna", "mistyrose"),space=0,border=NA,xlab="",ylab="admixture proportion")
text(x= as.vector(tapply(1:length(pop),pop,mean)),y= -0.05,labels= (unique(pop)),xpd=T)
title(main="K=7")

dev.off()

#find most probable K

cv <- c(0.48328, 0.44280, 0.41872, 0.41336, 0.41068, 0.41084)
k <- c(2,3,4,5,6,7)
plot(x=k, y=cv)


### TERNARY PLOT 
library(ggtern)
library(ggplot2)
library(reshape2)
library(scales)
library(gridExtra)

#Have to erun on my computer, something screwy on cluster
dat3 <- read.table("subsamp.chrom.3.Q")
id <- read.table("pca.sub.all.eigenvec", header=TRUE)
labels <- substr(id$IID, 1,2)
labs <- data.frame(population = labels, Individual = id$IID)
dat3 <- cbind(labs, dat3)
colnames(dat3)<- c("population", "Individual", "P1", "P2", "P3")

#Most geometries can be used as-is
plot.3 <- ggtern(data= dat3, aes(x = P2, y = P3, z= P1 )) +
			geom_point(aes( fill=population, color=population),  
					size=2, shape=21) +
			theme_bw() +
			geom_point(aes( fill=population),  
					size=2, shape=21)+
			tern_limit(T = 1.1, L = 1.1, R = 1.1) +
			scale_fill_manual(values=c("red", "blue", "forestgreen", "green", "purple", "black", "grey","yellow"))

pdf("tern.pdf")
plot.3
dev.off()

