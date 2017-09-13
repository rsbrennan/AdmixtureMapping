#
######## pull out global ancestry of the indivs #######
# want to save these outputs for use in gemma as covariates
specify_decimal <- function(x, k) format(round(x, k), nsmall=k)

##
## read in CB data
##
#acnestry assignments
cb <- read.table("~/admixture_mapping/results/cb.thinned.2.Q")
#individual id labels
id.cb <- read.table("~/admixture_mapping/variants/cb.thinned.fam")
#merge indiv and ancestry, round decimal to 3 places
cb.all <- as.data.frame(cbind(as.character(id.cb$V1),
							specify_decimal(as.numeric(cb$V1), 3)))

# add site variable
cb.all$pop <- substr(cb.all$V1, 1, 2)
cb.all$site <- c(NA)
cb.all$site[which(cb.all$pop == "PP")] <- c(0)
cb.all$site[which(cb.all$pop == "AF")] <- c(1)
cb.all$site[which(cb.all$pop == "PL")] <- c(2)

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

##
## site + pheotype specific weights
##

### hploe
hploe_mass <- read.table("~/admixture_mapping/phenotypes/hploe_cb.mass", header=FALSE)

cb.all.hploe.covar <- cbind(rep(1, nrow(cb.all)),
	as.character(hploe_mass$V1)) 

hploe <- cbind(cb.all.hploe.covar,as.character(cb.all$site))

write.table(hploe, "~/admixture_mapping/analysis/gwas/cb.site.hploe.covar",
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


### hploe
mo2_mass <- read.table("~/admixture_mapping/phenotypes/mo2_cb.mass", header=FALSE)

cb.all.mo2.covar <- cbind(rep(1, nrow(cb.all)),
	as.character(mo2_mass$V1)) 

mo2 <- cbind(cb.all.mo2.covar,as.character(cb.all$site))

write.table(mo2, "~/admixture_mapping/analysis/gwas/cb.site.mo2.covar",
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

### pchl
pchl_mass <- read.table("~/admixture_mapping/phenotypes/pchl_cb.mass", header=FALSE)

cb.all.pchl.covar <- cbind(rep(1, nrow(cb.all)),
	as.character(pchl_mass$V1)) 

pchl <- cbind(cb.all.pchl.covar,as.character(cb.all$site))

write.table(pchl, "~/admixture_mapping/analysis/gwas/cb.site.pchl.covar",
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")




