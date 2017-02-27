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

##### Temp ############

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

write.table(temp,"~/Documents/admixture_mapping/phenotypes/temp.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp[AF,],"~/Documents/admixture_mapping/phenotypes/temp.AF.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp[BC,],"~/Documents/admixture_mapping/phenotypes/temp.BC.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax,"~/Documents/admixture_mapping/phenotypes/temp.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[AF],"~/Documents/admixture_mapping/phenotypes/temp.AF.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")
write.table(temp$ctmax[BC],"~/Documents/admixture_mapping/phenotypes/temp.BC.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

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


###### Salinity ########

salinity <- subset(df, pop=="AF" | pop=="BC")
new <- salinity[!is.na(salinity$pchl),]


#The (1.5 * IQR) criteria for finding outliers (1.5 times IQR):
#An observation is suspected outliers if it is:
#Below Q1 - (1.5 * IQR): that is Q1 minus 1.5 times IQR.
#Above Q3 + (1.5 * IQR): that is Q2 minus 1.5 times IQR.

quantile(new$pchl)
lower <- which(new$pchl < quantile(new$pchl, 0.25) - (IQR(new$pchl)*1.5))
upper <- which(new$pchl > quantile(new$pchl, 0.75) + (IQR(new$pchl)*1.5))
all.outlier <- c(lower, upper)

library(outliers)

a <-scores(new$pchl, type="chisq", prob=0.95)
b <-scores(new$pchl, type="chisq", prob=0.99)

write.table(new[!a,], "~/Documents/admixture_mapping/phenotypes/pchl.95.txt",
		row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t"
)

write.table(new[!b,], "~/Documents/admixture_mapping/phenotypes/pchl.99.txt",
		row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t"
)


plot(new$spmass[a],new$pchl[a], ylim=c(50, 165), xlim=c(1.5, 16))
plot(new$spmass[b],new$pchl[b],ylim=c(50, 165), xlim=c(1.5, 16))
plot(new$spmass,new$pchl, ylim=c(50, 165), xlim=c(1.5, 16))

b <-scores(new$pchl, type="chisq", prob=0.99)
plot(new$spmass[b],new$pchl[b],ylim=c(50, 165), xlim=c(1.5, 16))



BC <- which(salinity$pop== "BC")
AF <- which(salinity$pop== "AF")





a<- ggplot(salinity, aes(log(spmass), pchl))
a + geom_point(aes(color=pop)) + theme_classic()+
scale_color_manual(values=c("tomato3", "royalblue"))

summary((lm(salinity$pchl ~ log(salinity$spmass), na.action=na.exclude)))

options(contrasts = c("contr.treatment", "contr.poly"))
r1 <- resid(lm(salinity$pchl ~ salinity$spmass, na.action=na.exclude))

a<- ggplot(salinity, aes(mass, r1))
a + geom_point(aes(color=pop)) + theme_classic()+
scale_color_manual(values=c("tomato3", "royalblue"))

cor.test(salinity$spmass,r1) # -> r = 3.019388e-1

summary((lm(r1 ~ salinity$spmass, na.action=na.exclude)))
summary((lm(r1 ~ salinity$pop, na.action=na.exclude)))

mod <- lm(salinity$pchl ~ salinity$spmass)

a<- ggplot(df, aes(pop, pchl))
a + geom_boxplot() + theme_classic()

#
test <- data.frame(pop=df$pop[(!is.na(df$pchl) & !is.na(df$spmass))], pchl=mod$fitted.values)

a<- ggplot(test, aes(pop, pchl))
a + geom_boxplot() + theme_classic()

write.table(r1,"~/Documents/admixture_mapping/phenotypes/salinity.id", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

write.table(cbind(df$label, r1),"~/Documents/admixture_mapping/phenotypes/salinity.pheno", 
	row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


#########

