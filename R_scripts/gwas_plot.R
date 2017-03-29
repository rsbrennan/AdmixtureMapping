
############### Plotting results ###################


library(qqman)


################
################
################
#### CTmax #####
################
################

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
################################
################################
#### hploe #####################
################################
################################

### read in files ######

bc.local <- read.table("~/admixture_mapping/analysis/gwas/output/bc.local.hypoxia.assoc.txt", header=TRUE)
colnames(bc.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.local <- read.table("~/admixture_mapping/analysis/gwas/output/af.local.hypoxia.assoc.txt", header=TRUE)
colnames(af.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.bc.local <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.local.hypoxia.assoc.txt", header=TRUE)
colnames(af.bc.local) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af.bc <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.covar.hypoxia.assoc.txt", header=TRUE)
colnames(af.bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
af <- read.table("~/admixture_mapping/analysis/gwas/output/af.covar.hypoxia.assoc.txt", header=TRUE)
colnames(af) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
bc <- read.table("~/admixture_mapping/analysis/gwas/output/bc.covar.hypoxia.assoc.txt", header=TRUE)
colnames(bc) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 

ac <- read.table("~/admixture_mapping/analysis/gwas/output/ac.covar.hypoxia.assoc.txt", header=TRUE)
colnames(ac) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
cb <- read.table("~/admixture_mapping/analysis/gwas/output/cb.covar.hypoxia.assoc.txt", header=TRUE)
colnames(cb) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
all <- read.table("~/admixture_mapping/analysis/gwas/output/N_S.remove.covar.hypoxia.assoc.txt", header=TRUE)
colnames(all) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 


####### global ancestry covariate, local ancestry ########

png("~/admixture_mapping/summary_files/hploe_local.png",width=7, height= 10, units="in", res = 300)
par(mfrow = c(6, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#num of blocks estimated from local ancestry: 12553

#png("bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc.local: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.local: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc.local, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.local: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(af, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()


####### global ancestry covariate ########


png("~/admixture_mapping/summary_files/hploe.covar.png",width=7, height= 10, units="in", res = 300)
par(mfrow = c(6, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#num of blocks estimated from local ancestry: 12553

#png("bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="bc.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.local.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(ac, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="coast.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(ac))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(cb, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="Chesapeake: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(cb))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
#png("af.bc.ctmax.png", h=1000, w=1700, pointsize=20)
manhattan(all, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()


####### global + zone covariate ########

af.bc.zone <- read.table("~/admixture_mapping/analysis/gwas/output/af.bc.zone.hypoxia.assoc.txt", header=TRUE)
colnames(af.bc.zone) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 
all.zone <- read.table("~/admixture_mapping/analysis/gwas/output/N_S.remove.zone.hypoxia.assoc.txt", header=TRUE)
colnames(all.zone) <-  c("CHR", "rs", "BP", "n_miss", "allele1", 
						"allele0", "af", "beta", "se", "l_remle","p_wald") 

png("~/admixture_mapping/summary_files/hploe.covar.zone.png",width=7, height=6.64, units="in", res = 300)
par(mfrow = c(4, 1))
par(mar = c(3, 3, 1, 1), oma = c(1, 1, 1, 1))

#num of blocks estimated from local ancestry: 12553

manhattan(af.bc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(af.bc.zone, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="af.bc.covar.zone: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(af.bc))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(all, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')
manhattan(all.zone, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="all.covar.zone: hploe", p="p_wald", ylim=c(0,8),
	logp=TRUE, ylab="-log10p")
abline(h=(-log10(0.05/nrow(all))), col='red')
abline(h=(-log10(0.05/12553)), col='blue')

dev.off()


################################
################################
################################
#### morph #####################
################################
################################

################################
################################
################################
#### pchl ######################
################################
################################

################################
################################
################################
#### metabolic rate ############
################################
################################

