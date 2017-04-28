dat <- read.table("~/admixture_mapping/variants/bgc/map.txt")
new <- as.data.frame(matrix(nrow=nrow(dat), ncol=3))
colnames(new) <- c("snp", "chrom", "dist")
chr <- unique(dat$V1)
for (i in 1:length(chr)){
	a <- which(dat$V1 == chr[i])
	new[a,1] <- seq(0,(length(a)-1), 1)
	new[a,2] <- dat$V1[a]
	new[a,3] <- dat$V2[a]
}

write.table(new, "~/admixture_mapping/variants/bgc/map.txt.1", 
	row.names=FALSE, col.names=FALSE,
	quote=FALSE)
