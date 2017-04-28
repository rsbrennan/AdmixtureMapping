library(Rphylip)
specify_decimal <- function(x, k) format(round(x, k), nsmall=k)
setwd("~/admixture_mapping/analysis/neighbor/")

dat <-read.table("AF.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
allele <- (dat$N_alleles)
fq.af <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
rownames(fq) <- c("af")
#write.table(fq,"AF.out", quote=FALSE, row.name=FALSE, col.name=FALSE)
#write.table(allele,"allele.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("PP.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.pp <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
rownames(fq) <- c("pp")
#write.table(fq,"PP.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("PL.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.pl <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"PL.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("GA.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.ga <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"GA.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("HP.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.hp <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"HP.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("BC.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.bc <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"BC.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("PC.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.pc <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"PC.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

dat <-read.table("TR.frq", header=TRUE, row.names=NULL)
colnames(dat) <- c("chrm", "pos", "N_alleles", "N_chr", "fq1", "fq2")
fq.tr <- specify_decimal(t(round(as.numeric(gsub(".:", "", dat$fq1)), digits=2)), 2)
#write.table(fq,"TR.out", quote=FALSE, row.name=FALSE, col.name=FALSE)

all <- matrix(nrow=length(allele), ncol=7)
all[,1] <- allele
all[,2] <- fq.pp
all[,3] <- fq.pl
all[,4] <- fq.af
#all[,5] <- fq.ga
all[,5] <- fq.hp
all[,6] <- fq.bc
all[,7] <- fq.pc
#all[,9] <- fq.tr 
colnames(all) <- c("allele", "pp", "pl", "af", "hp", "bc", "pc")

all <- all[(!is.na(as.numeric(all[,2]))),]
all <- all[(!is.na(as.numeric(all[,3]))),]
all <- all[(!is.na(as.numeric(all[,4]))),]
all <- all[(!is.na(as.numeric(all[,5]))),]
all <- all[(!is.na(as.numeric(all[,6]))),]
all <- all[(!is.na(as.numeric(all[,7]))),]
#all <- all[(!is.na(as.numeric(all[,8]))),]
#all <- all[(!is.na(as.numeric(all[,9]))),]

out <- t(all)

write.table(out,"infile.N_S_remove", quote=FALSE, row.name=TRUE, col.name=FALSE, sep=" ")
