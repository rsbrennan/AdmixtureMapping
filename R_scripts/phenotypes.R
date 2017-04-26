#ctmax: use any pop, as is.
#Hypoxia: remove high mass outliers and/or mass as covariate
#MO2: effect of mass and year. Include mass as covariate. Mass correct.
#chloride: there's an effect of mass.  
#morphology: size correct http://www.flywings.org.uk/MorphoJ_guide/frameset.htm?covariation/regression.htm

library(ggplot2)

dat <- read.csv("~/Documents/admixture_mapping/Coastal\ Project\ Data\ Summary_MASTER.csv")
ordered <- dat[order(dat$label),]
#remove indivs due to low coverege and the weird PC indivs
dat.remove <- subset(ordered, label!="AF-634-141" & label!="AF-635-142" & 
	label!="AF-636-143" & label!="AF-637-144" & label!="AF-638-145" &
	label!="AF-639-146" & label!="AF-640-147" & label!="AF-641-148" &
	label!="AF-506-244" & label!="BC-132-088" & label!="PC-369-001" & 
	label!="PC-386-017" )

write.table(matrix(dat.remove$label[dat.remove$label != ""],nrow=1), 
	"~/Documents/admixture_mapping/phenotypes/ordered.labels", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

df <- subset(dat.remove, pop=="AF" | pop=="BC")
BC <- which(df$pop== "BC")
AF <- which(df$pop== "AF")

##### ctmax ############

temp <- data.frame(id=df$label, ctmax=df$ctmax)
temp$pop <- substr(temp$id, 1,2)

plot(x=df$mass[BC], y=temp$ctmax[BC], 
	pch=19, col="blue",
	xlim=c(min(salinity$mass,na.rm = TRUE), max(salinity$mass,na.rm = TRUE)),
	ylim=c(min(salinity$ctmax,na.rm = TRUE), max(salinity$ctmax, na.rm = TRUE)))

points(x=df$mass[AF], y=df$ctmax[AF], 
	pch=19, col="red",)


a<- ggplot(temp, aes(pop, ctmax))
a + geom_boxplot() + theme_classic()


write.table(temp,"~/Documents/admixture_mapping/phenotypes/temp.af.bc.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp[AF,],"~/Documents/admixture_mapping/phenotypes/temp.af.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp[BC,],"~/Documents/admixture_mapping/phenotypes/temp.bc.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.af.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[AF],"~/Documents/admixture_mapping/phenotypes/temp.af.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[BC],"~/Documents/admixture_mapping/phenotypes/temp.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

#fill in missing
temp$ctmax[is.na(temp$ctmax)] <- c(33)
write.table(temp$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.af.bc.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[AF],"~/Documents/admixture_mapping/phenotypes/temp.af.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[BC],"~/Documents/admixture_mapping/phenotypes/temp.bc.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

#### include parent pops

parent <- data.frame(id=dat.remove$label, ctmax=dat.remove$ctmax)
parent$pop <- substr(parent$id, 1,2)

df <- subset(parent, pop=="AF" | pop=="BC" | pop=="PP" | pop=="PL" | pop=="HP" | pop=="PC")

write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.N_S.remove.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
df <- subset(parent, pop=="AF" | pop=="PP" | pop=="PL")
write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.cb.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
df$ctmax[is.na(df$ctmax)] <- c(33)
write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.N_S.remove.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.cb.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
df <- subset(parent, pop=="BC" | pop=="HP" | pop=="PC")
write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.ac.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(df$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.ac.pheno.alter", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")



#########
#########
#########
######### Hypoxia #############
#########
#########
#########

#Hypoxia: remove high mass outliers and/or mass as covariate
#probably mass as a covariate. I don't really see many outliers that can be removed.

dat <- read.csv("~/Documents/admixture_mapping/Coastal\ Project\ Data\ Summary_MASTER.csv")
ordered <- dat[order(dat$label),]
#remove indivs due to low coverege and the weird PC indivs
dat.remove <- subset(ordered, label!="AF-634-141" & label!="AF-635-142" & 
	label!="AF-636-143" & label!="AF-637-144" & label!="AF-638-145" &
	label!="AF-639-146" & label!="AF-640-147" & label!="AF-641-148" &
	label!="AF-506-244" & label!="BC-132-088" & label!="PC-369-001" & 
	label!="PC-386-017" )


parent <- data.frame(id=dat.remove$label, hploe=dat.remove$hploe, mass=dat.remove$hpmass)
parent$pop <- substr(parent$id, 1,2)

df <- subset(parent, pop=="AF" | pop=="BC" | pop=="PP" | pop=="PL" | pop=="HP" | pop=="PC")
#df <- subset(dat.remove, pop=="AF" | pop=="BC")
BC <- which(df$pop== "BC")
AF <- which(df$pop== "AF")

summary(lm(df$hploe ~ df$mass))

a <- ggplot(df, aes(x=mass, y=hploe))+
geom_point(aes(col=df$pop))+ theme_classic()+
 geom_smooth(method=lm)
a

hypoxia <- data.frame(id=df$id, hploe=df$hploe, mass=df$mass)
hypoxia$pop <- substr(hypoxia$id, 1,2)


a<- ggplot(hypoxia, aes(pop, hploe))
a + geom_boxplot() + theme_classic()

write.table(subset(hypoxia, pop=="AF"| pop=="BC")$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.af.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="AF")$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.af.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="BC")$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

## include parent pops
write.table(hypoxia$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.N_S.remove.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="BC"| pop=="HP" | pop=="PC")$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.ac.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="AF"| pop=="PP" | pop=="PL")$hploe,
	"~/Documents/admixture_mapping/phenotypes/hploe.cb.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


### Write hpmass covariate

write.table(subset(hypoxia, pop=="AF"| pop=="BC")$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.af.bc.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="AF")$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.af.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="BC")$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.bc.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

## include parent pops
write.table(hypoxia$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.N_S.remove.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="BC"| pop=="HP" | pop=="PC")$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.ac.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(hypoxia, pop=="AF"| pop=="PP" | pop=="PL")$mass,
	"~/Documents/admixture_mapping/phenotypes/hploe.cb.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")






#########
#########
#########
######### pchl #############
#########
#########
#########

#chloride: theres an effect of mass. removing outliers, 
#then trying to take out mass effect. 
#I'm removing outliers, tim is taking out effect of mass
dat <- read.csv("~/Documents/admixture_mapping/Coastal\ Project\ Data\ Summary_MASTER.csv")
ordered <- dat[order(dat$label),]
#remove indivs due to low coverege and the weird PC indivs
dat.remove <- subset(ordered, label!="AF-634-141" & label!="AF-635-142" & 
	label!="AF-636-143" & label!="AF-637-144" & label!="AF-638-145" &
	label!="AF-639-146" & label!="AF-640-147" & label!="AF-641-148" &
	label!="AF-506-244" & label!="BC-132-088" & label!="PC-369-001" & 
	label!="PC-386-017" )

parent <- data.frame(id=dat.remove$label, pchl=dat.remove$pchl, mass=dat.remove$spmass)
parent$pop <- substr(parent$id, 1,2)

df <- subset(parent, pop=="AF" | pop=="BC" | pop=="PP" | pop=="PL" | pop=="HP" | pop=="PC")


#salinity <- subset(df, pop=="AF" | pop=="BC")
new <- df[!is.na(df$pchl),]
new.na <- df[is.na(df$pchl),]

library(outliers)

a <-scores(new$pchl, type="chisq", prob=0.95)
b <-scores(new$pchl, type="chisq", prob=0.99)

write.table(new[!a,], "~/Documents/admixture_mapping/phenotypes/pchl.95.txt",
		row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t"
)

write.table(new[!b,], "~/Documents/admixture_mapping/phenotypes/pchl.99.txt",
		row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t"
)


#change outliers to NA
a <-scores(new$pchl, type="chisq", prob=0.95)
new$pchl.mod <- new$pchl
new$pchl.mod[a] <- c(NA)
new.na$pchl.mod <- c(NA)
combined <- rbind(new, new.na)
combined.ordered <- combined[order(combined$id),]

#write new dataframe
chloride <- data.frame(id=combined.ordered$id, pchl=combined.ordered$pchl.mod, mass=combined.ordered$mass)
chloride$pop <- substr(chloride$id, 1,2)

#write phenotype to file
write.table(subset(chloride, pop=="AF"| pop=="BC")$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.af.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="AF")$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.af.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="BC")$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.bc.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

# include parent pops
write.table(chloride$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.N_S.remove.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="BC"| pop=="HP" | pop=="PC")$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.ac.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="AF"| pop=="PP" | pop=="PL")$pchl,
	"~/Documents/admixture_mapping/phenotypes/pchl.cb.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


### Write hpmass covariate

write.table(subset(chloride, pop=="AF"| pop=="BC")$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.af.bc.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="AF")$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.af.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="BC")$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.bc.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

## include parent pops
write.table(chloride$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.N_S.remove.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="BC"| pop=="HP" | pop=="PC")$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.ac.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(subset(chloride, pop=="AF"| pop=="PP" | pop=="PL")$mass,
	"~/Documents/admixture_mapping/phenotypes/pchl.cb.mass", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")








######### Metabolic Rate
#MO2: effect of mass and year. Include mass as covariate. 
# could also try to mass Mass correct... including a covariate seems easy
# Tim sent mass corrected values for the admixed populations alone. 
# the confounding issue of year is a problem... might not be able to combine these. 
## could combine p values from two sep analyses??


######### Morphology
#morphology: size correct http://www.flywings.org.uk/MorphoJ_guide/frameset.htm?covariation/regression.htm






###### Hematocrit ######

library(ggplot2)

plot(x=dat$sex, y=dat$hct, 
	pch=19, col=c("blue", "red")[dat$sex], type="p")
	xlim=c(min(salinity$mass,na.rm = TRUE), max(salinity$mass,na.rm = TRUE)),
	ylim=c(min(salinity$ctmax,na.rm = TRUE), max(salinity$ctmax, na.rm = TRUE)))

points(x=df$mass[AF], y=df$ctmax[AF], 
	pch=19, col="red",)

summary((lm(df$hct ~ df$sex, na.action=na.exclude)))
options(contrasts = c("contr.treatment", "contr.poly"))
r1 <- resid(lm(df$hct ~ df$sex, na.action=na.exclude))

summary(lm(r1 ~ df$pop))

options(contrasts = c("contr.treatment", "contr.poly"))
r2 <- resid(lm(dat.remove$hct ~ dat.remove$sex, na.action=na.exclude))
ggplot(dat.remove, aes(x = dat.remove$pop, y = r2)) + 
    geom_boxplot()


