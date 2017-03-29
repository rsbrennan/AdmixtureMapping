

######## pull out global ancestry of the indivs #######
# want to save these outputs for use in gemma as covariates
specify_decimal <- function(x, k) format(round(x, k), nsmall=k) 

ac <-read.table("~/admixture_mapping/results/chrom.AC.all.2.Q")
cb <- read.table("~/admixture_mapping/results/chrom.CB.all.2.Q")
all <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.2.Q")
id.ac <- read.table("~/admixture_mapping/variants/chrom.AC.all.fam")
id.cb <- read.table("~/admixture_mapping/variants/chrom.CB.all.fam")
id.all <- read.table("~/admixture_mapping/variants/N_S.remove.subsamp.fam")
ordered <- dat[order(dat$label),]

ac.all.global <- as.data.frame(cbind(as.character(id.ac$V1), 
								specify_decimal(as.numeric(ac$V1), 3)))
ac.alone.global<- subset(ac.all.global, grepl('BC', ac.all.global$V1))
cb.all.global <- as.data.frame(cbind(as.character(id.cb$V1), 
								specify_decimal(as.numeric(cb$V1), 3)))
cb.alone.global <- subset(cb.all.global, grepl('AF', cb.all.global$V1)) 
all.global <-  rbind(ac.all.global, cb.all.global)
all.global <- all.global[order(as.character(all.global$V1)),]
all.alone.global <- subset(all.global, grepl('AF|BC', all.global$V1)) 
all.alone.global <- all.alone.global[order(as.character(all.alone.global$V1)),]


###################### write gemma covariate files ##############

##### Global ancestry
ac.all.global.covar <- cbind(rep(1, nrow(ac.all.global)), as.character(ac.all.global$V2))
ac.alone.global.covar <- cbind(rep(1, nrow(ac.alone.global)), as.character(ac.alone.global$V2))
cb.all.global.covar <- cbind(rep(1, nrow(cb.all.global)), as.character(cb.all.global$V2))
cb.alone.global.covar <- cbind(rep(1, nrow(cb.alone.global)), as.character(cb.alone.global$V2))
all.global.covar <- cbind(rep(1, nrow(all.global)), as.character(all.global$V2))
all.alone.global.covar <- cbind(rep(1, nrow(all.alone.global)), as.character(all.alone.global$V2))

write.table(ac.all.global.covar,"~/admixture_mapping/analysis/gwas/ac.all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(ac.alone.global.covar,"~/admixture_mapping/analysis/gwas/ac.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.all.global.covar,"~/admixture_mapping/analysis/gwas/cb.all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.alone.global.covar,"~/admixture_mapping/analysis/gwas/cb.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.global.covar,"~/admixture_mapping/analysis/gwas/all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.covar,"~/admixture_mapping/analysis/gwas/all.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

##### Global ancestry plus "hybrid zone" as covariate

all.global.covar

#Coast=1, chesapeake=0

all.global.zone <- cbind(all.global.covar, rep(NA, nrow(all.global)) )
all.global.zone[,3][grepl('AF|PP|PL', all.global$V1)] <- c(0)
all.global.zone[,3][grepl('BC|HP|PC', all.global$V1)] <- c(1)

all.alone.global.zone <- cbind(all.alone.global.covar, rep(NA, nrow(all.alone.global)) )
all.alone.global.zone[,3][grepl('AF|PP|PL', all.alone.global$V1)] <- c(0)
all.alone.global.zone[,3][grepl('BC|HP|PC', all.alone.global$V1)] <- c(1)

write.table(all.global.zone,"~/admixture_mapping/analysis/gwas/all.global.zone.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.zone,"~/admixture_mapping/analysis/gwas/all.alone.global.zone.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


############### Plotting results ###################


library(qqman)

####### without covariates ########

bc.local <- read.table("~/admixture_mapping/analysis/gwas/output/bc.local.assoc.txt", header=TRUE)
colnames(bc.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.local <- read.table("~/admixture_mapping/analysis/gwas/output/af.local.assoc.txt", header=TRUE)
colnames(af.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.bc.local <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.local.assoc.txt", header=TRUE)
colnames(af.bc.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.bc <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.assoc.txt", header=TRUE)
colnames(af.bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af <- read.table("~/admixture_mapping/analysis/gwas/output/af.assoc.txt", header=TRUE)
colnames(af) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
bc <- read.table("~/admixture_mapping/analysis/gwas/output/bc.assoc.txt", header=TRUE)
colnames(bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 


png("ctmax.png",width=7, height= 10, units="in", res = 300)
par(mfrow = c(6, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

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










######### calc number of snps

snp.num <- 0
for (i in 1:length(names(data_list))){
	snp.num <- snp.num + dim(data_list[[i]])[2]
}





######## Temp ##########

ctmax <- read.table("~/admixture_mapping/phenotypes/temp.id", header=FALSE)
df <- data.frame(pop= substr(ctmax$V1, 1,2),
				ctmax=ctmax$V2, 
				global=as.numeric(as.character(global.ancestry$V2)))

png("~/admixture_mapping/summary_files/ctmax_admixprop.png", width=700, height= 700, units="px")
plot(x=df$global, y=df$ctmax, col=c("red", "blue")[df$pop], pch=19)
dev.off()

png("~/admixture_mapping/summary_files/admixprop.png",width=5, height= 5, units="in", res = 300)
a<- ggplot(df, aes(df$pop, df$global))
a + geom_boxplot() + theme_classic()
#scale_color_manual(values=c("tomato3", "royalblue"))
dev.off()

indiv.res<- as.data.frame(matrix(NA,ncol=4,nrow=snp.num))
colnames(indiv.res) <- c("chr", "estimate", "stderr", "P")
indiv.res$P <- c("NA")

nams <- names(data_list)
for(chr in 1:length(nams)){
	a <- which(indiv.res$P == "NA")
	start <- a[1] - 1
	for(i in 1:dim(data_list[[nams[chr]]])[2]){
		df <- data.frame(ctmax=ctmax$V2, 
						ancestry=data_list[[nams[chr]]][1,i,], 
						global=as.numeric(as.character(global.ancestry$V2)))
		lm.fit=summary(lm(ctmax ~ ancestry + global, data=df,
			na.action=na.exclude))
		indiv.res[start+i,] <- c(nams[chr],lm.fit$coefficients[2,c(1,2,4)])
 	}
 }

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.ctmax.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.ctmax.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="pchl gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()




############### Not done below this point #####################


###### pchl ###########


salinity <- read.table("~/admixture_mapping/phenotypes/salinity.id", header=FALSE)
df <- data.frame(pop= substr(ctmax$V1, 1,2),
				ctmax=ctmax$V2, 
				global=as.numeric(as.character(global.ancestry$V2)))

png("~/admixture_mapping/summary_files/ctmax_admixprop.png", width=700, height= 700, units="px")
plot(x=df$global, y=df$ctmax, col=c("red", "blue")[df$pop], pch=19)
dev.off()

png("~/admixture_mapping/summary_files/admixprop.png",width=5, height= 5, units="in", res = 300)
a<- ggplot(df, aes(df$pop, df$global))
a + geom_boxplot() + theme_classic()
#scale_color_manual(values=c("tomato3", "royalblue"))
dev.off()

indiv.res<- as.data.frame(matrix(NA,ncol=4,nrow=snp.num))
colnames(indiv.res) <- c("chr", "estimate", "stderr", "P")
indiv.res$P <- c("NA")

nams <- names(data_list)
for(chr in 1:length(nams)){
	a <- which(indiv.res$P == "NA")
	start <- a[1] - 1
	for(i in 1:dim(data_list[[nams[chr]]])[2]){
		df <- data.frame(ctmax=ctmax$V2, 
						ancestry=data_list[[nams[chr]]][1,i,], 
						global=as.numeric(as.character(global.ancestry$V2)))
		lm.fit=summary(lm(ctmax ~ ancestry + global, data=df,
			na.action=na.exclude))
		indiv.res[start+i,] <- c(nams[chr],lm.fit$coefficients[2,c(1,2,4)])
 	}
 }

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.ctmax.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.ctmax.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="pchl gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()




m <- ncol(new)
indiv.res=matrix(NA,ncol=3,nrow=m)
for(i in 1:m){
	lm.fit=lm(pheno.af$pchl~new[,i]+ancest$P1[1:length(out)]+pheno.af$sex, na.action=na.exclude)
	indiv.res[i,]=summary(lm.fit)$coefficients[2,c(1,2,4)]
 }

colnames(indiv.res) <- c("estimate", "stderr", "P")

df <- data.frame(SNP= snp$rs, BP = snp$pos, CHR= snp$chr, estimate=indiv.res[,1], stderr= indiv.res[,2], P= indiv.res[,3])

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.pchl.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.pchl.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="pchl gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()

#plot density of observed and expected z-scores
pdf("~/admixture_mapping/summary_files/figures/gwas.chl.zscores.pdf", width=5, height=5)
plot(density(indiv.res[,1]/indiv.res[,2],na.rm=TRUE),main="",sub="",xlab="est(b)",ylim=c(0,0.5))
x=seq(-4,4,length.out=1000)
lines(x,dnorm(x),lty=2,col="red")
legend("topleft",lty=c(1,2),col=c("black","red"),legend=c("obs'd","exp'd"))
dev.off()



library(qqman)

#read in snp into
snp <- read.table("~/admixture_mapping/analysis/elai/output/snpinfo.mod.txt", header=FALSE)
colnames(snp) <- c("rs","pos","chr")

# read in ancestry assignments
yy=scan("~/admixture_mapping/analysis/elai/output/all.combined.ps21.txt");
dim(yy)=c(2, (nrow(snp)), 248);

new <- (matrix(unlist(yy[2,,]), ncol=length(yy[2,,1]), byrow=TRUE))
out <- c()
for (i in 1:nrow(new)){
	out[i] <- 1-(mean(new[i,])/2)
}

# read in hybrid index and sex
ancest <- read.table("~/admixture_mapping/variants/admixture.txt", header=FALSE)
sex <- read.table("~/admixture_mapping/scripts/sex.txt", header=FALSE)
ancest <- cbind(ancest, sex$V2)
colnames(ancest) <- c("pop", "indiv", "P1", "P2", "sex")
# read in phenotypes, fix missing data to na
pheno <- read.table("~/admixture_mapping/scripts/phenotypes_cb.input.txt", header=TRUE)
pheno$amo2 <- (gsub("-9", NA,pheno$amo2))
pheno$ctmax <- (gsub("-9", NA,pheno$ctmax))
pheno$hploe <- (gsub("-9", NA,pheno$hploe))
pheno$pchl <- (gsub("-9", NA,pheno$pchl))
#pheno[pheno$pchl != "NA" & pheno$pchl != "NA",]

pheno <- cbind(pheno, ancest[,3:5])

#pull out only admixed indivs
pheno.af <- pheno[grep("AF", pheno$FID),]

#Compute single-SNP statistics

