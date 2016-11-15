
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

###### pchl ###########
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

###### hploe ###########
m <- ncol(new)
indiv.res=matrix(NA,ncol=3,nrow=m)
for(i in 1:m){
	lm.fit=lm(pheno.af$hploe~new[,i]+ancest$P1[1:length(out)]+pheno.af$sex, na.action=na.exclude)
	indiv.res[i,]=summary(lm.fit)$coefficients[2,c(1,2,4)]
 }

colnames(indiv.res) <- c("estimate", "stderr", "P")

df <- data.frame(SNP= snp$rs, BP = snp$pos, CHR= snp$chr, estimate=indiv.res[,1], stderr= indiv.res[,2], P= indiv.res[,3])

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.hploe.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.hploe.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="hploe gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()

#plot density of observed and expected z-scores
pdf("~/admixture_mapping/summary_files/figures/gwas.hploe.zscores.pdf", width=5, height=5)
plot(density(indiv.res[,1]/indiv.res[,2],na.rm=TRUE),main="",sub="",xlab="est(b)",ylim=c(0,0.5))
x=seq(-4,4,length.out=1000)
lines(x,dnorm(x),lty=2,col="red")
legend("topleft",lty=c(1,2),col=c("black","red"),legend=c("obs'd","exp'd"))
dev.off()

###### ctmax ###########
m <- ncol(new)
indiv.res=matrix(NA,ncol=3,nrow=m)
for(i in 1:m){
	lm.fit=lm(pheno.af$ctmax~new[,i]+ancest$P1[1:length(out)]+pheno.af$sex, na.action=na.exclude)
	indiv.res[i,]=summary(lm.fit)$coefficients[2,c(1,2,4)]
 }

colnames(indiv.res) <- c("estimate", "stderr", "P")

df <- data.frame(SNP= snp$rs, BP = snp$pos, CHR= snp$chr, estimate=indiv.res[,1], stderr= indiv.res[,2], P= indiv.res[,3])

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.ctmax.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.ctmax.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="ctmax gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()

#plot density of observed and expected z-scores
pdf("~/admixture_mapping/summary_files/figures/gwas.ctmax.zscores.pdf", width=5, height=5)
plot(density(indiv.res[,1]/indiv.res[,2],na.rm=TRUE),main="",sub="",xlab="est(b)",ylim=c(0,0.5))
x=seq(-4,4,length.out=1000)
lines(x,dnorm(x),lty=2,col="red")
legend("topleft",lty=c(1,2),col=c("black","red"),legend=c("obs'd","exp'd"))
dev.off()

###### amo2 ###########
m <- ncol(new)
indiv.res=matrix(NA,ncol=3,nrow=m)
for(i in 1:m){
	lm.fit=lm(pheno.af$amo2~new[,i]+ancest$P1[1:length(out)]+pheno.af$sex, na.action=na.exclude)
	indiv.res[i,]=summary(lm.fit)$coefficients[2,c(1,2,4)]
 }

colnames(indiv.res) <- c("estimate", "stderr", "P")

df <- data.frame(SNP= snp$rs, BP = snp$pos, CHR= snp$chr, estimate=indiv.res[,1], stderr= indiv.res[,2], P= indiv.res[,3])

write.table(df, "~/admixture_mapping/analysis/gwas/gwas.amo2.out", row.names=FALSE)

#plot manhattan
pdf("~/admixture_mapping/summary_files/figures/gwas.amo2.manhattan.pdf", width=10, height=5)
manhattan(df, suggestiveline = F, genomewideline = F, cex=0.7, main="amo2 gwas", p="P", logp=TRUE )
abline(h=(-log10(0.05/6000)), col='red')
dev.off()

#plot density of observed and expected z-scores
pdf("~/admixture_mapping/summary_files/figures/gwas.amo2.zscores.pdf", width=5, height=5)
plot(density(indiv.res[,1]/indiv.res[,2],na.rm=TRUE),main="",sub="",xlab="est(b)",ylim=c(0,0.5))
x=seq(-4,4,length.out=1000)
lines(x,dnorm(x),lty=2,col="red")
legend("topleft",lty=c(1,2),col=c("black","red"),legend=c("obs'd","exp'd"))
dev.off()





