library(data.table)
library(stringr)

# allele count files: AF.BC.raw AF.raw BC.raw CB.raw AC.raw N_S.remove.raw
setwd("~/admixture_mapping/variants/gwas")

######## AF ############
cb <- (fread("~/admixture_mapping/variants/gwas/AF.raw"))
cb.1 <- as.data.frame(cb)
cb.2 <- t(cb.1[,7:ncol(cb)])
colnames(cb.2) <- cb.1$FID
cb.3 <-cbind(data.frame(snpname=row.names(cb.2), a1=rep(0,nrow(cb.2)), a2=rep(1, nrow(cb.2))), cb.2)
cb.3$snpname <- gsub("_[A-Z]", "", cb.3$snpname)
#cb.3$snpname <- gsub("_[0-9]", "", cb.3$snpname)

#write bimbam file
write.table(cb.3, "af.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
cb.snp.annot <- data.frame(snp.id=cb.3$snpname, pos=str_split_fixed(cb.3$snpname, ":", 2)[,2], chr=str_split_fixed(cb.3$snpname, ":", 2)[,1] )
write.table(cb.snp.annot, "af.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
