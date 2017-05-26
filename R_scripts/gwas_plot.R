
############### Plotting results ###################

library(qqman)


## read in all data

setwd("~/admixture_mapping/analysis/gwas/output")
filelist = list.files(pattern = "*assoc.txt")
data_list = lapply(filelist, read.table, header=TRUE)

file_name <- gsub("cb.", "", filelist)
file_name <- gsub(".assoc.txt", "", file_name)

names(data_list)<-file_name
colnames <- c("CHR", "rs", "BP", "n_miss", "allele1", 
				"allele0", "af", "beta", "se", "l_remle","p_wald")
data_list <- lapply(data_list, setNames, colnames)

####
#### write bed files of outliers
####

sig <- -log10(0.05/87308)

#ctmax
ctmax.out <- data_list[['ctmax.masscorrect']][which(-log10(data_list[['ctmax.masscorrect']]$p_wald) >= sig),]
ctmax.bed <- cbind(as.character(ctmax.out$CHR), ctmax.out$BP-1, ctmax.out$BP)
write.table(ctmax.bed, "~/admixture_mapping/analysis/gwas/gwas_ctmax.bed",
	quote=FALSE, col.names=FALSE, row.names=FALSE, sep="\t")

#mo2
mo2.out <- data_list[['mo2.masscorrect']][which(-log10(data_list[['mo2.masscorrect']]$p_wald) >= sig),]
mo2.bed <- cbind(as.character(mo2.out$CHR), mo2.out$BP-1, mo2.out$BP)
write.table(mo2.bed, "~/admixture_mapping/analysis/gwas/gwas_mo2.bed",
	quote=FALSE, col.names=FALSE, row.names=FALSE, sep="\t")


###
###need to make chromosome names numeric
###
chr <- sapply(data_list, function(x) gsub("NW_0","",(x[,1])))
chr <- sapply(chr, function(x) gsub("chr","",(x)))
chr <- sapply(chr, function(x) as.numeric(x))

for(i in 1:length(chr)){
	a <- names(chr)[i]
	data_list[[a]][,1] <- chr[[a]]
}



# number of snps after ld pruning: 87308

####
#### CTmax plot
####

png("~/admixture_mapping/figures/gwas.ctmax.png",width=10, height= 5, units="in", res = 300)
par(mfrow = c(1, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

manhattan(data_list[['ctmax.masscorrect']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['ctmax.masscorrect']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')

dev.off()


####
#### Pchl plot
####

png("~/admixture_mapping/figures/gwas.pchl.png",width=10, height= 10, units="in", res = 300)
par(mfrow = c(2, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

manhattan(data_list[['pchl.masscorrect']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake pchl: mass corrected", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['pchl.masscorrect']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')

manhattan(data_list[['pchl.masscovar']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake pchl: mass covariate", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['pchl.masscovar']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')


dev.off()

####
#### hploe plot
####

png("~/admixture_mapping/figures/gwas.hploe.png",width=10, height= 10, units="in", res = 300)
par(mfrow = c(2, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

manhattan(data_list[['hploe.masscorrect']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake hploe: mass corrected", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['hploe.masscorrect']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')

manhattan(data_list[['hploe.masscovar']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake hploe: mass covariate", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['hploe.masscovar']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')


dev.off()

####
#### mo2 plot
####

png("~/admixture_mapping/figures/gwas.mo2.png",width=10, height= 10, units="in", res = 300)
par(mfrow = c(2, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

manhattan(data_list[['mo2.masscorrect']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake mo2: mass corrected", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['mo2.masscorrect']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')

manhattan(data_list[['mo2.masscovar']], suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake mo2: mass covariate", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(data_list[['mo2.masscovar']]))), col='red')
abline(h=(-log10(0.05/87308)), col='blue')


dev.off()



####
####
####





#num of blocks estimated from local ancestry: 12553

#png("bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc.local: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.local: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.local: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(af, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()

#### Correlation between methods

library(dplyr)
library(scales)
out <- inner_join(af, bc, by='rs')
cor(out$p_wald.x, out$p_wald.y)

out <- inner_join(af.bc, bc, by='rs')
cor(out$p_wald.x, out$p_wald.y)
out <- inner_join(af.bc, af, by='rs')
cor(out$p_wald.x, out$p_wald.y)

out <- inner_join(af.bc.local, af.bc, by='rs')
cor(out$p_wald.x, out$p_wald.y)

out <- inner_join(bc.local, bc, by='rs')
cor(out$p_wald.x, out$p_wald.y)

out <- inner_join(af.local, af, by='rs')
cor(out$p_wald.x, out$p_wald.y)
out <- inner_join(af.local, af.bc.local, by='rs')
cor(out$p_wald.x, out$p_wald.y)
out <- inner_join(bc.local, af.bc.local, by='rs')
cor(out$p_wald.x, out$p_wald.y)

#### pull out extremes

quant <- quantile(-log10(af.bc.local$p_wald),c(0.95, 0.99), na.rm=TRUE)
outlie.af.bc.local <- af.bc.local[which(-log10(af.bc.local$p_wald) > quant[2]),]

quant <- quantile(-log10(af.bc$p_wald),c(0.95, 0.99), na.rm=TRUE)
outlie.af.bc <- af.bc[which(-log10(af.bc$p_wald) > quant[2]),]
out <- inner_join(outlie.af.bc.local, outlie.af.bc , by='rs')


########### global ancestry covariates added ####
library(qqman)

bc <- read.table("~/admixture_mapping/analysis/gwas/output/bc.covar.assoc.txt", header=TRUE)
colnames(bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af <- read.table("~/admixture_mapping/analysis/gwas/output/af.covar.assoc.txt", header=TRUE)
colnames(af) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.bc <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.covar.assoc.txt", header=TRUE)
colnames(af.bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
ac <- read.table("~/admixture_mapping/analysis/gwas/output/ac.covar.assoc.txt", header=TRUE)
colnames(ac) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
cb <- read.table("~/admixture_mapping/analysis/gwas/output/cb.covar.assoc.txt", header=TRUE)
colnames(cb) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
all <- read.table("~/admixture_mapping/analysis/gwas/output/N_S.remove.covar.assoc.txt", header=TRUE)
colnames(all) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 


png("~/admixture_mapping/summary_files/ctmax.covar.png",width=7, height= 10, units="in", res = 300)
par(mfrow = c(6, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#num of blocks estimated from local ancestry: 12553

#png("bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(ac, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="coast.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(ac))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(cb, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(cb))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(all, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()


########### global ancestry+ hybrid zone covariates added ####

af.bc.zone <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.zone.assoc.txt", header=TRUE)
colnames(af.bc.zone) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
all.zone <- read.table("~/admixture_mapping/analysis/gwas/output/N_S.remove.zone.assoc.txt", header=TRUE)
colnames(all.zone) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 


png("~/admixture_mapping/summary_files/ctmax.covar.zone.png",width=7, height=6.64, units="in", res = 300)
par(mfrow = c(4, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#num of blocks estimated from local ancestry: 12553

manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(af.bc.zone, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar.zone: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(all, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(all.zone, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar.zone: ctmax", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()



################################


