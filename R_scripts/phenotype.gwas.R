#####
##### Formatting phenotype files for chesapeake populations
##### data from Tim Healy, 2017-05-18
#####
#####

##### Notes about data
# 4 phenotype files: Chloride, hypoxia, max temp, metabolic rate
# of these, chloride, hypoxia, and metabolic rate have influence of mass
# temp is not affected by mass
# those phenotypes with mass effect include mass corrected values (to a 4g fish)
# want to test both mass correct and not correct for these. 


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

#### 
#### chloride
####

dat.cl <- read.table("~/admixture_mapping/phenotypes/chesaPCHL.csv", 
			sep=",", 
			header=TRUE)

#merge, include individuals without pchl values
dat.cl.merge <- merge(geno.included, dat.cl, by="label", all=TRUE)
dat.cl.merge$MCpchl <- round(dat.cl.merge$MCpchl, 3)

#not mass corrected
write.table(dat.cl.merge$pchl, 
				"~/admixture_mapping/phenotypes/pchl_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)
#mass corrected
write.table(dat.cl.merge$MCpchl, 
				"~/admixture_mapping/phenotypes/pchl_mass_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)
#write mass for covariate
write.table(dat.cl.merge$spmass, 
				"~/admixture_mapping/phenotypes/pchl_cb.mass",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#quantile normalization:
write.table(qqnorm(dat.cl.merge$pchl,plot.it =F)$x, 
				"~/admixture_mapping/phenotypes/pchl_norm_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)


#### 
#### hypoxia
####

dat.hploe <- read.table("~/admixture_mapping/phenotypes/chesaLOE.csv", 
			sep=",", 
			header=TRUE)

#merge, include individuals without pchl values
dat.hploe.merge <- merge(geno.included, dat.hploe, by="label", all=TRUE)
dat.hploe.merge$MChploe <- round(dat.hploe.merge$MChploe, 3)

#not mass corrected
write.table(dat.hploe.merge$hploe, 
				"~/admixture_mapping/phenotypes/hploe_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)
#mass corrected
write.table(dat.hploe.merge$MChploe, 
				"~/admixture_mapping/phenotypes/hploe_mass_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#write mass for covariate
write.table(dat.hploe.merge$hpmass, 
				"~/admixture_mapping/phenotypes/hploe_cb.mass",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#quantile normalization:
write.table(qqnorm(dat.hploe.merge$hploe,plot.it =F)$x, 
				"~/admixture_mapping/phenotypes/hploe_norm_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#### 
#### metabolic rate
####

dat.mo2 <- read.table("~/admixture_mapping/phenotypes/chesaMO2.csv", 
			sep=",", 
			header=TRUE)

#merge, include individuals without pchl values
dat.mo2.merge <- merge(geno.included, dat.mo2, by="label", all=TRUE)
dat.mo2.merge$MCamo2 <- round(dat.mo2.merge$MCamo2, 3)

#not mass corrected
write.table(dat.mo2.merge$amo2, 
				"~/admixture_mapping/phenotypes/mo2_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)
#mass corrected
write.table(dat.mo2.merge$MCamo2, 
				"~/admixture_mapping/phenotypes/mo2_mass_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#write mass for covariate
write.table(dat.mo2.merge$mass, 
				"~/admixture_mapping/phenotypes/mo2_cb.mass",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#quantile normalization:
write.table(qqnorm(dat.mo2.merge$amo2,plot.it =F)$x, 
				"~/admixture_mapping/phenotypes/mo2_norm_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#### 
#### CTmax
####

dat.ctmax <- read.table("~/admixture_mapping/phenotypes/chesaCTM.csv", 
			sep=",", 
			header=TRUE)

#merge, include individuals without pchl values
dat.ctmax.merge <- merge(geno.included, dat.ctmax, by="label", all=TRUE)
dat.ctmax.merge$calctmax <- round(dat.ctmax.merge$calctmax, 3)

#not mass corrected
write.table(dat.ctmax.merge$calctmax, 
				"~/admixture_mapping/phenotypes/ctmax_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)

#quantile normalization:
write.table(qqnorm(dat.ctmax.merge$calctmax,plot.it =F)$x, 
				"~/admixture_mapping/phenotypes/ctmax_norm_cb.pheno",
				quote=FALSE, row.name=FALSE, col.name=FALSE)







