#format mitotype

################################################
##
## mitotype as response variable
##
###############################################

# only want to use admixed individuals

mito <- read.table("~/admixture_mapping/mitotype_id.txt")
colnames(mito) <- c("label", "mitotype")



####
#### read in all chesapeake individuals with genotype data in analysis
####

#all individuals that were genotyped
#328 total
#PP= 40
#PL = 40
#AF = 248

geno.included <- read.table("~/admixture_mapping/scripts/poplists/CB.indivs", header=FALSE)
colnames(geno.included) <- c("label")
geno.included$pop <- substr(geno.included$label, 1,2)
geno.included <- subset(geno.included, pop == "AF")

#merge mitotypes with genotypes


#merge, include individuals without pchl values
dat.merge <- merge(x=geno.included, y=mito, by="label", all.x=TRUE)

out <- data.frame(mito= dat.merge$mitotype)
out$mito <- gsub("S", "1", out$mito)
out$mito <- gsub("N", "0", out$mito)

write.table(out$mito, file="~/admixture_mapping/analysis/gwas/af.mito.pheno",
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")



