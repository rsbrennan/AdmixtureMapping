

dat <-plot_bayescan("PP.PL.1k_fst.txt", FDR=0.05, add_text=F)
plot_bayescan("PP.PL.10k_fst.txt", FDR=0.05, add_text=F)
plot_bayescan("PC.HP.1k_fst.txt", FDR=0.05, add_text=F)
plot_bayescan("TR.GA.1k_fst.txt", FDR=0.05, add_text=F)


pp.pl.1k <- read.table("~/admixture_mapping/analysis/bayescan/PP.PL.1k_fst.txt")
pc.hp.1k <- read.table("PC.HP.1k_fst.txt")
tr.ga.1k <- read.table("TR.GA.1k_fst.txt")

pp.pl.outlier <- pp.pl.1k[which(pp.pl.1k$qval< 0.05),]
pc.hp.outlier <- pc.hp.1k[which(pc.hp.1k$qval< 0.05),]

library(data.table)
vcf <- as.data.frame(fread("cat ~/admixture_mapping/variants/PC-chrom.vcf | grep -v '^#'", header=FALSE))

pp.pl.bed <- as.data.frame(vcf[row.names(pp.pl.outlier), 1:2])
pp.pl.bed$V3 <-  pp.pl.bed$V2
pp.pl.bed$V2 <-  pp.pl.bed$V3-1
pp.pl.bed$V1 <- gsub("chr", "", pp.pl.bed$V1)
pp.pl

pc.hp.bed <- as.data.frame(vcf[row.names(pc.hp.outlier), 1:2])
pc.hp.bed$V3 <-  pc.hp.bed$V2
pc.hp.bed$V2 <-  pc.hp.bed$V3-1
pc.hp.bed$V1 <- gsub("chr", "", pc.hp.bed$V1)

write.table(file="pp-pl.bayescan.bed",pp.pl.bed,sep="\t",quote=F,row.names=F,col.names=F)
write.table(file="pc-hp.bayescan.bed",pc.hp.bed,sep="\t",quote=F,row.names=F,col.names=F)
