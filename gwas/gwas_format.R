######## pull out global ancestry of the indivs #######
# want to save these outputs for use in gemma as covariates
specify_decimal <- function(x, k) format(round(x, k), nsmall=k) 

##
## read in CB data
##
#acnestry assignments
cb <- read.table("~/admixture_mapping/results/CB.thinned.2.Q")
#individual id labels
id.cb <- read.table("~/admixture_mapping/variants/CB.thinned.fam")
#merge indiv and ancestry, round decimal to 3 places
cb.all <- as.data.frame(cbind(as.character(id.cb$V1), 
							specify_decimal(as.numeric(cb$V1), 3)))
#order of individuals from gwas input, to check that everything matches
cb.order <- read.table("~/admixture_mapping/variants/gwas/gwas.order", header=FALSE)

##########################################
###
### write covariate files
###
##########################################

##
## genome-wide ancestry
##

cb.all.covar <- cbind(rep(1, nrow(cb.all)), as.character(cb.all$V2))

write.table(cb.all.covar, "~/admixture_mapping/analysis/gwas/cb.all.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

##
## genome-wide ancestry + pheotype specific weights
##

### ctmax
#no effect of mass, no covariate necessary

### hploe
hploe_mass <- read.table("~/admixture_mapping/phenotypes/hploe_cb.mass", header=FALSE)

cb.all.hploe.covar <- cbind(rep(1, nrow(cb.all)), 
	as.character(cb.all$V2), 
	as.character(hploe_mass$V1))

write.table(cb.all.hploe.covar, "~/admixture_mapping/analysis/gwas/cb.all.hploe.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

### mo2

mo2_mass <- read.table("~/admixture_mapping/phenotypes/mo2_cb.mass", header=FALSE)

cb.all.mo2.covar <- cbind(rep(1, nrow(cb.all)), 
	as.character(cb.all$V2), 
	as.character(mo2_mass$V1))

write.table(cb.all.mo2.covar, "~/admixture_mapping/analysis/gwas/cb.all.mo2.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

### pchl
pchl_mass <- read.table("~/admixture_mapping/phenotypes/pchl_cb.mass", header=FALSE)

cb.all.pchl.covar <- cbind(rep(1, nrow(cb.all)), 
	as.character(cb.all$V2), 
	as.character(pchl_mass$V1))

write.table(cb.all.pchl.covar, "~/admixture_mapping/analysis/gwas/cb.all.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")



###################################################################
###################################################################
###################################################################
## ignore everything below this line as of 2017-05-19
# these scripts work for old phenotypes and for both hybrid zones


ac <-read.table("~/admixture_mapping/results/chrom.AC.all.2.Q")
all <- read.table("~/admixture_mapping/results/N_S.remove.subsamp.2.Q")
id.ac <- read.table("~/admixture_mapping/variants/chrom.AC.all.fam")
id.cb <- read.table("~/admixture_mapping/variants/chrom.CB.all.fam")
id.all <- read.table("~/admixture_mapping/variants/N_S.remove.subsamp.fam")

ac.all.global <- as.data.frame(cbind(as.character(id.ac$V1), 
								specify_decimal(as.numeric(ac$V1), 3)))
ac.alone.global<- subset(ac.all.global, grepl('BC', ac.all.global$V1))
cb.all.global <- as.data.frame(cbind(as.character(id.cb$V1), 
								specify_decimal(as.numeric(cb$V1), 3)))
cb.alone.global <- subset(cb.all.global, grepl('AF', cb.all.global$V1)) 
all.global <-  rbind(ac.all.global, cb.all.global)
all.global <- all.global[order(as.character(all.global$V1)),]
all.alone.global <- subset(all.global, grepl('AF|BC', all.global$V1)) 
all.alone.global <- all.alone.global[order(as.character(all.alone.global$V1)),]


###################### write gemma covariate files ##############

##### Global ancestry
ac.all.global.covar <- cbind(rep(1, nrow(ac.all.global)), as.character(ac.all.global$V2))
ac.alone.global.covar <- cbind(rep(1, nrow(ac.alone.global)), as.character(ac.alone.global$V2))
cb.all.global.covar <- cbind(rep(1, nrow(cb.all.global)), as.character(cb.all.global$V2))
cb.alone.global.covar <- cbind(rep(1, nrow(cb.alone.global)), as.character(cb.alone.global$V2))
all.global.covar <- cbind(rep(1, nrow(all.global)), as.character(all.global$V2))
all.alone.global.covar <- cbind(rep(1, nrow(all.alone.global)), as.character(all.alone.global$V2))

write.table(ac.all.global.covar,"~/admixture_mapping/analysis/gwas/ac.all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(ac.alone.global.covar,"~/admixture_mapping/analysis/gwas/ac.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.all.global.covar,"~/admixture_mapping/analysis/gwas/cb.all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.alone.global.covar,"~/admixture_mapping/analysis/gwas/cb.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.global.covar,"~/admixture_mapping/analysis/gwas/all.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.covar,"~/admixture_mapping/analysis/gwas/all.alone.global.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

##### Global ancestry plus "hybrid zone" as covariate

#all.global.covar

#Coast=1, chesapeake=0

all.global.zone <- cbind(all.global.covar, rep(NA, nrow(all.global)) )
all.global.zone[,3][grepl('AF|PP|PL', all.global$V1)] <- c(0)
all.global.zone[,3][grepl('BC|HP|PC', all.global$V1)] <- c(1)

all.alone.global.zone <- cbind(all.alone.global.covar, rep(NA, nrow(all.alone.global)) )
all.alone.global.zone[,3][grepl('AF|PP|PL', all.alone.global$V1)] <- c(0)
all.alone.global.zone[,3][grepl('BC|HP|PC', all.alone.global$V1)] <- c(1)

write.table(all.global.zone,"~/admixture_mapping/analysis/gwas/all.global.zone.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.zone,"~/admixture_mapping/analysis/gwas/all.alone.global.zone.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

###########
###########
###########
#### hploe covariates
###########
###########

#read in mass values for each data set
ac.mass <-read.table("~/admixture_mapping/analysis/gwas/hploe.ac.mass", header=FALSE)
cb.mass <- read.table("~/admixture_mapping/analysis/gwas/hploe.cb.mass", header=FALSE)
all.mass <- read.table("~/admixture_mapping/analysis/gwas/hploe.N_S.remove.mass", header=FALSE)
af.mass <- read.table("~/admixture_mapping/analysis/gwas/hploe.af.mass", header=FALSE)
bc.mass <- read.table("~/admixture_mapping/analysis/gwas/hploe.bc.mass", header=FALSE)
af.bc.mass <- read.table("~/admixture_mapping/analysis/gwas/hploe.af.bc.mass", header=FALSE)

#bind mass to ancestry covariate dataframes
ac.all.global.hyp.covar <- as.data.frame(cbind(ac.all.global.covar, ac.mass))
ac.alone.global.hyp.covar <- as.data.frame(cbind(ac.alone.global.covar, bc.mass))
cb.all.global.hyp.covar <- as.data.frame(cbind(cb.all.global.covar, cb.mass))
cb.alone.global.hyp.covar <- as.data.frame(cbind(cb.alone.global.covar, af.mass)) 
all.global.hyp.covar <- as.data.frame(cbind(all.global.covar, all.mass))
all.alone.global.hyp.covar <- as.data.frame(cbind(all.alone.global.covar,af.bc.mass)) 

#write covariate files
write.table(ac.all.global.hyp.covar,"~/admixture_mapping/analysis/gwas/ac.all.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(ac.alone.global.hyp.covar,"~/admixture_mapping/analysis/gwas/ac.alone.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.all.global.hyp.covar,"~/admixture_mapping/analysis/gwas/cb.all.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.alone.global.hyp.covar,"~/admixture_mapping/analysis/gwas/cb.alone.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.global.hyp.covar,"~/admixture_mapping/analysis/gwas/all.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.hyp.covar,"~/admixture_mapping/analysis/gwas/all.alone.global.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

##### Global ancestry plus "hybrid zone" as covariate


#Coast=1, chesapeake=0
#bind mass to these covariate files, same as above.
all.global.hyp.zone <- cbind(all.global.zone, all.mass)

all.alone.global.hyp.zone <- cbind(all.alone.global.zone, af.bc.mass)

write.table(all.global.hyp.zone,"~/admixture_mapping/analysis/gwas/all.global.zone.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.hyp.zone,"~/admixture_mapping/analysis/gwas/all.alone.global.zone.hyp.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

###########
###########
###########
#### ctmax covariates
###########
###########

ac.mass <-read.table("~/admixture_mapping/analysis/gwas/pchl.ac.mass", header=FALSE)
cb.mass <- read.table("~/admixture_mapping/analysis/gwas/pchl.cb.mass", header=FALSE)
all.mass <- read.table("~/admixture_mapping/analysis/gwas/pchl.N_S.remove.mass", header=FALSE)
af.mass <- read.table("~/admixture_mapping/analysis/gwas/pchl.af.mass", header=FALSE)
bc.mass <- read.table("~/admixture_mapping/analysis/gwas/pchl.bc.mass", header=FALSE)
af.bc.mass <- read.table("~/admixture_mapping/analysis/gwas/pchl.af.bc.mass", header=FALSE)

#bind mass to ancestry covariate dataframes
ac.all.global.pchl.covar <- as.data.frame(cbind(ac.all.global.covar, ac.mass))
ac.alone.global.pchl.covar <- as.data.frame(cbind(ac.alone.global.covar, bc.mass))
cb.all.global.pchl.covar <- as.data.frame(cbind(cb.all.global.covar, cb.mass))
cb.alone.global.pchl.covar <- as.data.frame(cbind(cb.alone.global.covar, af.mass)) 
all.global.pchl.covar <- as.data.frame(cbind(all.global.covar, all.mass))
all.alone.global.pchl.covar <- as.data.frame(cbind(all.alone.global.covar,af.bc.mass)) 

#write covariate files
write.table(ac.all.global.pchl.covar,"~/admixture_mapping/analysis/gwas/ac.all.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(ac.alone.global.pchl.covar,"~/admixture_mapping/analysis/gwas/ac.alone.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.all.global.pchl.covar,"~/admixture_mapping/analysis/gwas/cb.all.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(cb.alone.global.pchl.covar,"~/admixture_mapping/analysis/gwas/cb.alone.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.global.pchl.covar,"~/admixture_mapping/analysis/gwas/all.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.pchl.covar,"~/admixture_mapping/analysis/gwas/all.alone.global.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

##### Global ancestry plus "hybrid zone" as covariate

#Coast=1, chesapeake=0
#bind mass to these covariate files, same as above.
all.global.pchl.zone <- cbind(all.global.zone, all.mass)

all.alone.global.pchl.zone <- cbind(all.alone.global.zone, af.bc.mass)

write.table(all.global.pchl.zone,"~/admixture_mapping/analysis/gwas/all.global.zone.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(all.alone.global.pchl.zone,"~/admixture_mapping/analysis/gwas/all.alone.global.zone.pchl.covar", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


