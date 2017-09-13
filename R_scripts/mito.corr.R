mito <- read.table("~/admixture_mapping/mitotype_id.txt")
colnames(mito) <- c("label", "mitotype")
mito$pop <- substr(mito$indiv, 1,2)
mito <- subset(mito, pop == "AF")

geno.included <- read.table("~/admixture_mapping/scripts/poplists/CB.indivs", header=FALSE)
colnames(geno.included) <- c("label")

## mo2

dat.mo2 <- read.table("~/admixture_mapping/phenotypes/chesaMO2.csv",
			sep=",",
			header=TRUE)

#merge, include individuals without pchl values
dat.mo2.merge <- merge(geno.included, dat.mo2, by="label", all=TRUE)

mo2 <- merge(dat.mo2.merge, mito, by="label", all.y=TRUE)

summary(lm(mo2$amo2~ mo2$mitotype+mo2$mass))

#hploe
dat.hploe <- read.table("~/admixture_mapping/phenotypes/chesaLOE.csv",
			sep=",",
			header=TRUE)
dat.hploe.merge <- merge(geno.included, dat.hploe, by="label", all=TRUE)
hploe <- merge(dat.hploe.merge, mito, by="label", all.y=TRUE)

summary(lm(hploe$hploe~ hploe$mitotype+hploe$hpmass))

# pchl
dat.pchl <- read.table("~/admixture_mapping/phenotypes/chesaPCHL.csv",
			sep=",",
			header=TRUE)
dat.pchl.merge <- merge(geno.included, dat.pchl, by="label", all=TRUE)
pchl <- merge(dat.pchl.merge, mito, by="label", all.y=TRUE)

summary(lm(pchl$pchl~ pchl$mitotype+pchl$spmass))
