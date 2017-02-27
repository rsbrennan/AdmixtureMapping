library(data.table)
library(stringr)

# allele count files: AF.BC.raw  AF.BC.thin.raw  AF.raw  AF.thin.raw  BC.raw  BC.thin.raw 
setwd("~/admixture_mapping/variants/")
######## BC, not thinned ############
bc <- (fread("BC.raw"))
bc.1 <- as.data.frame(bc)
bc.2 <- t(bc.1[,7:ncol(bc)])
colnames(bc.2) <- bc.1$FID
bc.3 <-cbind(data.frame(snpname=row.names(bc.2), a1=rep(0,nrow(bc.2)), a2=rep(1, nrow(bc.2))), bc.2)
bc.3$snpname <- gsub("_[A-Z]", "", bc.3$snpname)
bc.3$snpname <- gsub("_[0-9]", "", bc.3$snpname)

#write bimbam file
write.table(bc.3, "bc.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
bc.snp.annot <- data.frame(snp.id=bc.3$snpname, pos=str_split_fixed(bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(bc.3$snpname, ":", 2)[,1] )
write.table(bc.snp.annot, "bc.snp.thin.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

######### AF, not thinned ############
af <- (fread("AF.raw"))
af.1 <- as.data.frame(af)
af.2 <- t(af.1[,7:ncol(af)])
colnames(af.2) <- af.1$FID
af.3 <-cbind(data.frame(snpname=row.names(af.2), a1=rep(0,nrow(af.2)), a2=rep(1, nrow(af.2))), af.2)
af.3$snpname <- gsub("_[A-Z]", "", af.3$snpname)
af.3$snpname <- gsub("_[0-9]", "", af.3$snpname)

write.table(af.3, "af.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.snp.annot <- data.frame(snp.id=af.3$snpname, pos=str_split_fixed(af.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.3$snpname, ":", 2)[,1] )
write.table(af.snp.annot, "af.snp.thin.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

########## AF.BC, not thinned ###########
af.bc <- (fread("AF.BC.raw"))
af.bc.1 <- as.data.frame(af.bc)
af.bc.2 <- t(af.bc.1[,7:ncol(af.bc)])
#a <- (format(round(af.bc.2, 2), nsmall = 2))
colnames(af.bc.2) <- af.bc.1$FID
af.bc.3 <-cbind(data.frame(snpname=row.names(af.bc.2), a1=rep("A",nrow(af.bc.2)), a2=rep("T", nrow(af.bc.2))), af.bc.2)
af.bc.3$snpname <- gsub("_[A-Z]", "", af.bc.3$snpname)
af.bc.3$snpname <- gsub("_[0-9]", "", af.bc.3$snpname)

write.table(af.bc.3, "af.bc.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.bc.snp.annot <- data.frame(snp.id=af.bc.3$snpname, pos=str_split_fixed(af.bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.bc.3$snpname, ":", 2)[,1] )
write.table(af.bc.snp.annot, "af.bc.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


###########
###########
########### Thinned files
###########
###########

######## BC, thinned ############
bc <- (fread("BC.thin.raw"))
bc.1 <- as.data.frame(bc)
bc.2 <- t(bc.1[,7:ncol(bc)])
colnames(bc.2) <- bc.1$FID
bc.3 <-cbind(data.frame(snpname=row.names(bc.2), a1=rep(0,nrow(bc.2)), a2=rep(1, nrow(bc.2))), bc.2)
bc.3$snpname <- gsub("_[A-Z]", "", bc.3$snpname)
bc.3$snpname <- gsub("_[0-9]", "", bc.3$snpname)

#write bimbam file
write.table(bc.3, "bc.bimbam.thin.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
bc.snp.annot <- data.frame(snp.id=bc.3$snpname, pos=str_split_fixed(bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(bc.3$snpname, ":", 2)[,1] )
write.table(bc.snp.annot, "bc.snp.thin.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

######### AF, thinned ############
af <- (fread("AF.thin.raw"))
af.1 <- as.data.frame(af)
af.2 <- t(af.1[,7:ncol(af)])
colnames(af.2) <- af.1$FID
af.3 <-cbind(data.frame(snpname=row.names(af.2), a1=rep(0,nrow(af.2)), a2=rep(1, nrow(af.2))), af.2)
af.3$snpname <- gsub("_[A-Z]", "", af.3$snpname)
af.3$snpname <- gsub("_[0-9]", "", af.3$snpname)

write.table(af.3, "af.bimbam.thin.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.snp.annot <- data.frame(snp.id=af.3$snpname, pos=str_split_fixed(af.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.3$snpname, ":", 2)[,1] )
write.table(af.snp.annot, "af.snp.thin.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

########## AF.BC,  thinned ###########
af.bc <- (fread("AF.BC.thin.raw"))
af.bc.1 <- as.data.frame(af.bc)
af.bc.2 <- t(af.bc.1[,7:ncol(af.bc)])
#a <- (format(round(af.bc.2, 2), nsmall = 2))
colnames(af.bc.2) <- af.bc.1$FID
af.bc.3 <-cbind(data.frame(snpname=row.names(af.bc.2), a1=rep("A",nrow(af.bc.2)), a2=rep("T", nrow(af.bc.2))), af.bc.2)
af.bc.3$snpname <- gsub("_[A-Z]", "", af.bc.3$snpname)
af.bc.3$snpname <- gsub("_[0-9]", "", af.bc.3$snpname)

write.table(af.bc.3, "af.bc.bimbam.thin.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.bc.snp.annot <- data.frame(snp.id=af.bc.3$snpname, pos=str_split_fixed(af.bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.bc.3$snpname, ":", 2)[,1] )
write.table(af.bc.snp.annot, "af.bc.snp.thin.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")








