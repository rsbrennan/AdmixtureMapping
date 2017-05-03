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

pi <- read.table("~/admixture_mapping/analysis/pi/all.chrom.sumstats.tsv", header=FALSE)

colnames(pi) <- c("Batch ID", "Locus ID" ,"CHR","BP", 
					"Col", "Pop","P Nuc", "Q Nuc", "N","P",	
					"Obs Het","Obs Hom","Exp Het","Exp Hom","Pi","Smoothed_Pi","Smoothed Pi P-value",
					"Fis","Smoothed Fis","Smoothed Fis P-value", "Private")
pi$snp <- paste(pi$CHR, pi$BP, sep=":")

pp <- pi[which(pi$Pop == "PP"),]
pl <- pi[which(pi$Pop == "PL"),]
pc <- pi[which(pi$Pop == "HP"),]
hp <- pi[which(pi$Pop == "PC"),]

#pp vs pl
pp.pl <- merge(x=pp, y=pl, by="snp")
pp.pl$CHR <- pp.pl$CHR.x
pp.pl$BP <- pp.pl$BP.x

pp.pl$diff.pi <- pp.pl$Pi.x- pp.pl$Pi.y
pp.pl$diff.pi.smooth <- pp.pl$Smoothed_Pi.x- pp.pl$Smoothed_Pi.y
pp.pl <-pp.pl[order(pp.pl$CHR),]
pp.pl$CHR <- (gsub("chr", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("NW_0", "",pp.pl$CHR))
pp.pl$CHR <- (gsub("\\.1", "",pp.pl$CHR))
pp.pl$CHR <- as.numeric(pp.pl$CHR)

#hp vs pc

hp.pc <- merge(x=pc, y=hp, by="snp")
hp.pc$CHR <- hp.pc$CHR.x
hp.pc$BP <- hp.pc$BP.x
hp.pc$diff.pi <- hp.pc$Pi.x - hp.pc$Pi.y
hp.pc$diff.pi.smooth <- hp.pc$Smoothed_Pi.x - hp.pc$Smoothed_Pi.y
hp.pc <-hp.pc[order(hp.pc$CHR),]
hp.pc$CHR <- (gsub("chr", "",hp.pc$CHR))
hp.pc$CHR <- (gsub("NW_0", "",hp.pc$CHR))
hp.pc$CHR <- (gsub("\\.1", "",hp.pc$CHR))
hp.pc$CHR <- as.numeric(hp.pc$CHR)


###
### plot pp.pl pi
###

quant <- quantile(pp.pl$diff.pi,c(0.01, 0.99), na.rm=TRUE)

# plot snp by snp pi

png("~/admixture_mapping/figures/pp-pl_pi.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="pi- PP vs. PL", p="diff.pi", logp=FALSE, ylab="pi", 
	ylim=c((min(pp.pl$diff.pi)*1.05), (max(pp.pl$diff.pi)*1.05)))
abline(h=quant[2], col='red')
abline(h=quant[1], col='red')
dev.off()

#hist of snp by snp
a <-ggplot(pp.pl, aes(x=diff.pi)) +
	geom_histogram(aes(y=..density..),
					binwidth=0.01,
					colour="black",
					fill="white")+
	geom_density(alpha=0.2, fill="black")+
	ggtitle("pi- PP vs PL") +
	theme_bw() +
	theme(plot.title = element_text(hjust = 0.5))


ggsave(filename="~/admixture_mapping/figures/pp-pl_pi_hist.png", plot=a)


#smoothed pi

quant <- quantile(pp.pl$diff.pi.smooth,c(0.01, 0.99), na.rm=TRUE)

png("~/admixture_mapping/figures/pp-pl_pi_smooth.png", h=1000, w=1700, pointsize=20)
manhattan(pp.pl, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="pi- PP vs. PL- smoothed", p="diff.pi.smooth", logp=FALSE, ylab="pi", 
	ylim=c((min(pp.pl$diff.pi)*1.05), (max(pp.pl$diff.pi)*1.05)))
abline(h=quant[2], col='red')
abline(h=quant[1], col='red')
dev.off()

#hist of smoothed

a <-ggplot(pp.pl, aes(x=diff.pi.smooth)) +
	geom_histogram(aes(y=..density..),
					binwidth=0.01,
					colour="black",
					fill="white")+
	geom_density(alpha=0.2, fill="black")+
	ggtitle("pi- PP vs PL- smoothed") +
	theme_bw() +
	theme(plot.title = element_text(hjust = 0.5))


ggsave(filename="~/admixture_mapping/figures/pp-pl_pi_smooth_hist.png", plot=a)

###
### plot hp.pc pi
###


quant <- quantile(hp.pc$diff.pi,c(0.01, 0.99), na.rm=TRUE)

# plot snp by snp pi

png("~/admixture_mapping/figures/hp-pc_pi.png", h=1000, w=1700, pointsize=20)
manhattan(hp.pc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="pi- PC vs. HP", p="diff.pi", logp=FALSE, ylab="pi", 
	ylim=c((min(hp.pc$diff.pi)*1.05), (max(hp.pc$diff.pi)*1.05)))
abline(h=quant[2], col='red')
abline(h=quant[1], col='red')
dev.off()


#hist of snp by snp

a <-ggplot(hp.pc, aes(x=diff.pi)) +
	geom_histogram(aes(y=..density..),
					binwidth=0.01,
					colour="black",
					fill="white")+
	geom_density(alpha=0.2, fill="black")+
	ggtitle("pi- HP vs PC") +
	theme_bw() +
	theme(plot.title = element_text(hjust = 0.5))


ggsave(filename="~/admixture_mapping/figures/hp-pc_pi_hist.png", plot=a)


#smoothed pi

quant <- quantile(hp.pc$diff.pi.smooth,c(0.01, 0.99), na.rm=TRUE)

png("~/admixture_mapping/figures/hp-pc_pi_smooth.png", h=1000, w=1700, pointsize=20)
manhattan(hp.pc, suggestiveline = F, genomewideline = F, cex=0.7, 
	main="pi- HP vs. PC- smoothed", p="diff.pi.smooth", logp=FALSE, ylab="pi", 
	ylim=c((min(hp.pc$diff.pi)*1.05), (max(hp.pc$diff.pi)*1.05)))
abline(h=quant[2], col='red')
abline(h=quant[1], col='red')
dev.off()

#hist of smoothed

a <-ggplot(hp.pc, aes(x=diff.pi.smooth)) +
	geom_histogram(aes(y=..density..),
					binwidth=0.01,
					colour="black",
					fill="white")+
	geom_density(alpha=0.2, fill="black")+
	ggtitle("pi- HP vs PC- smoothed") +
	theme_bw() +
	theme(plot.title = element_text(hjust = 0.5))

ggsave(filename="~/admixture_mapping/figures/hp-pc_pi_smooth_hist.png", plot=a)

