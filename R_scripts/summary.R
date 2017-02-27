library(ggplot2)
library(gridExtra)


######## raw demultiplexed reads ###############

###### all

rawreads.CB1 <-read.csv ("count.demultiplex.all-CB-1.txt", header=FALSE)
rawreads.CB2 <-read.csv ("count.demultiplex.all-CB-2.txt", header=FALSE)
rawreads.CB3 <-read.csv ("count.demultiplex.all-CB-3.txt", header=FALSE)
rawreads.CB4 <-read.csv ("count.demultiplex.all-CB-4.txt", header=FALSE)
rawreads.CB1$lib <- c("CB-1")
rawreads.CB2$lib <- c("CB-2")
rawreads.CB3$lib <- c("CB-3")
rawreads.CB4$lib <- c("CB-4")

colnames(rawreads.CB1) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB2) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB3) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB4) <- c("indiv", "R1", "R2", "lib")

rawreads.CB1$pop <- substring(rawreads.CB1$indiv, 1, 2)
rawreads.CB2$pop <- substring(rawreads.CB2$indiv, 1, 2)
rawreads.CB3$pop <- substring(rawreads.CB3$indiv, 1, 2)
rawreads.CB4$pop <- substring(rawreads.CB4$indiv, 1, 2)


rawreads.CB1$count <- rawreads.CB1$R1/4
rawreads.CB2$count <- rawreads.CB2$R1/4
rawreads.CB3$count <- rawreads.CB3$R1/4
rawreads.CB4$count <- rawreads.CB4$R1/4

rawreads.CB1$count2 <- rawreads.CB1$R2/4
rawreads.CB2$count2 <- rawreads.CB2$R2/4
rawreads.CB3$count2 <- rawreads.CB3$R2/4
rawreads.CB4$count2 <- rawreads.CB4$R2/4


dat <- rbind(rawreads.CB1, rawreads.CB2)
dat <- rbind(dat, rawreads.CB3)
dat <- rbind(dat, rawreads.CB4)


#Raw 
a<- ggplot(data = rawreads.CB1, aes(y= count, x= indiv, fill=pop))+ 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.CB1$count)), color='green') +
geom_hline(yintercept= (median(rawreads.CB1$count)), color='blue') + 
ggtitle("All Reads-CB-1") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000))
a

b <- ggplot(data = rawreads.CB2, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.CB2$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.CB2$count)), color='blue') + 
ggtitle("All Reads-CB-2") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none")+ ylim(c(0, 1900000))
b

c <- ggplot(data = rawreads.CB3, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.CB3$count)), color='green') +
geom_hline(yintercept= (median(rawreads.CB3$count)), color='blue') + 
ggtitle("All Reads-CB-3") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000))
c

d<- ggplot(data = rawreads.CB4, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red","snow4", "black","white","blue", "springgreen4")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.CB4$count[which(rawreads.CB4$count > 8000)])), color='green') + 
geom_hline(yintercept= (median(rawreads.CB4$count[which(rawreads.CB4$count > 8000)])), color='blue') + 
ggtitle("All Reads-CB-4") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000)) 
d

png("CB-all.png", width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d, ncol=2)
dev.off()

###### renorm

rawreads.CB1 <-read.csv ("count.demultiplex.renorm-CB-1.txt", header=FALSE)
rawreads.CB2 <-read.csv ("count.demultiplex.renorm-CB-2.txt", header=FALSE)
rawreads.CB3 <-read.csv ("count.demultiplex.renorm-CB-3.txt", header=FALSE)
rawreads.CB4 <-read.csv ("count.demultiplex.renorm-CB-4.txt", header=FALSE)
rawreads.CB1$lib <- c("CB-1")
rawreads.CB2$lib <- c("CB-2")
rawreads.CB3$lib <- c("CB-3")
rawreads.CB4$lib <- c("CB-4")

colnames(rawreads.CB1) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB2) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB3) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.CB4) <- c("indiv", "R1", "R2", "lib")

rawreads.CB1$pop <- substring(rawreads.CB1$indiv, 1, 2)
rawreads.CB2$pop <- substring(rawreads.CB2$indiv, 1, 2)
rawreads.CB3$pop <- substring(rawreads.CB3$indiv, 1, 2)
rawreads.CB4$pop <- substring(rawreads.CB4$indiv, 1, 2)


rawreads.CB1$count <- rawreads.CB1$R1/4
rawreads.CB2$count <- rawreads.CB2$R1/4
rawreads.CB3$count <- rawreads.CB3$R1/4
rawreads.CB4$count <- rawreads.CB4$R1/4

rawreads.CB1$count2 <- rawreads.CB1$R2/4
rawreads.CB2$count2 <- rawreads.CB2$R2/4
rawreads.CB3$count2 <- rawreads.CB3$R2/4
rawreads.CB4$count2 <- rawreads.CB4$R2/4


dat <- rbind(rawreads.CB1, rawreads.CB2)
dat <- rbind(dat, rawreads.CB3)
dat <- rbind(dat, rawreads.CB4)


#Raw 
a<- ggplot(data = rawreads.CB1, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + 
theme_bw() + geom_hline(yintercept= (mean(rawreads.CB1$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.CB1$count)), color='blue') + 
ggtitle("renorm Reads-CB-1") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000))
a

b<- ggplot(data = rawreads.CB2, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + theme_bw() + 
geom_hline(yintercept= (mean(rawreads.CB2$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.CB2$count)), color='blue') + 
ggtitle("renorm Reads-CB-2") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none")+ ylim(c(0, 1900000))
b

c<- ggplot(data = rawreads.CB3, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4")) + theme_bw() + 
geom_hline(yintercept= (mean(rawreads.CB3$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.CB3$count)), color='blue') + ggtitle("renorm Reads-CB-3") + 
ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000))
c

d<- ggplot(data = rawreads.CB4, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red","snow4", "black","white","blue", "springgreen4")) + theme_bw() + 
geom_hline(yintercept= (mean(rawreads.CB4$count[which(rawreads.CB4$count > 8000)])), color='green') + 
geom_hline(yintercept= (median(rawreads.CB4$count[which(rawreads.CB4$count > 8000)])), color='blue') + 
ggtitle("renorm Reads-CB-4") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 1900000)) 
d

png("CB-renorm.png",  width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d, ncol=2)
dev.off()


######## AC run 1 ##########


rawreads.ac1 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.AC-1.txt", header=FALSE)
rawreads.ac2 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.AC-2.txt", header=FALSE)
rawreads.ac3 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.AC-3.txt", header=FALSE)
rawreads.ac4 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.AC-4.txt", header=FALSE)
rawreads.ac5 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.AC-5.txt", header=FALSE)

rawreads.ac1$lib <- c("ac-1")
rawreads.ac2$lib <- c("ac-2")
rawreads.ac3$lib <- c("ac-3")
rawreads.ac4$lib <- c("ac-4")
rawreads.ac5$lib <- c("ac-5")


colnames(rawreads.ac1) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.ac2) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.ac3) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.ac4) <- c("indiv", "R1", "R2", "lib")
colnames(rawreads.ac5) <- c("indiv", "R1", "R2", "lib")

rawreads.ac1$pop <- substring(rawreads.ac1$indiv, 1, 2)
rawreads.ac2$pop <- substring(rawreads.ac2$indiv, 1, 2)
rawreads.ac3$pop <- substring(rawreads.ac3$indiv, 1, 2)
rawreads.ac4$pop <- substring(rawreads.ac4$indiv, 1, 2)
rawreads.ac5$pop <- substring(rawreads.ac5$indiv, 1, 2)


rawreads.ac1$count <- rawreads.ac1$R1/4
rawreads.ac2$count <- rawreads.ac2$R1/4
rawreads.ac3$count <- rawreads.ac3$R1/4
rawreads.ac4$count <- rawreads.ac4$R1/4
rawreads.ac5$count <- rawreads.ac5$R1/4

rawreads.ac1$count2 <- rawreads.ac1$R2/4
rawreads.ac2$count2 <- rawreads.ac2$R2/4
rawreads.ac3$count2 <- rawreads.ac3$R2/4
rawreads.ac4$count2 <- rawreads.ac4$R2/4
rawreads.ac5$count2 <- rawreads.ac5$R2/4

#Raw 
a<- ggplot(data = rawreads.ac1, aes(y= count, x= indiv, fill=pop))+ 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac1$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac1$count)), color='blue') + 
ggtitle("All Reads-ac-1") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
a

b <- ggplot(data = rawreads.ac2, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac2$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac2$count)), color='blue') + 
ggtitle("All Reads-ac-2") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none")+ ylim(c(0, 2300000))
b

c <- ggplot(data = rawreads.ac3, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac3$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac3$count)), color='blue') + 
ggtitle("All Reads-ac-3") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
c

d<- ggplot(data = rawreads.ac4, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac4$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac4$count)), color='blue') + 
ggtitle("All Reads-CB-4") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
d

e<- ggplot(data = rawreads.ac5, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac5$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac5$count)), color='blue') + 
ggtitle("All Reads-ac-5") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
e

png("ac-demulti-run1.png", width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d,e, ncol=2)
dev.off()

###### AC run-2

rawreads.ac1 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane2.AC-1.txt", header=FALSE)
rawreads.ac2 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane2.AC-2.txt", header=FALSE)
rawreads.ac3 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane2.AC-3.txt", header=FALSE)
rawreads.ac4 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane2.AC-4.txt", header=FALSE)
rawreads.ac5 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane2.AC-5.txt", header=FALSE)

rawreads.ac1$lib <- c("ac-1")
rawreads.ac2$lib <- c("ac-2")
rawreads.ac3$lib <- c("ac-3")
rawreads.ac4$lib <- c("ac-4")
rawreads.ac5$lib <- c("ac-5")


colnames(rawreads.ac1) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac2) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac3) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac4) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac5) <- c("indiv","lane", "R1", "R2", "lib")

rawreads.ac1$pop <- substring(rawreads.ac1$indiv, 1, 2)
rawreads.ac2$pop <- substring(rawreads.ac2$indiv, 1, 2)
rawreads.ac3$pop <- substring(rawreads.ac3$indiv, 1, 2)
rawreads.ac4$pop <- substring(rawreads.ac4$indiv, 1, 2)
rawreads.ac5$pop <- substring(rawreads.ac5$indiv, 1, 2)


rawreads.ac1$count <- rawreads.ac1$R1/4
rawreads.ac2$count <- rawreads.ac2$R1/4
rawreads.ac3$count <- rawreads.ac3$R1/4
rawreads.ac4$count <- rawreads.ac4$R1/4
rawreads.ac5$count <- rawreads.ac5$R1/4


#Raw 
a<- ggplot(data = rawreads.ac1, aes(y= count, x= indiv, fill=pop))+ 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac1$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac1$count)), color='blue') + 
ggtitle("All Reads-ac-1") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
a

b <- ggplot(data = rawreads.ac2, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac2$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac2$count)), color='blue') + 
ggtitle("All Reads-ac-2") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none")+ ylim(c(0, 2300000))
b

c <- ggplot(data = rawreads.ac3, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac3$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac3$count)), color='blue') + 
ggtitle("All Reads-ac-3") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
c

d<- ggplot(data = rawreads.ac4, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac4$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac4$count)), color='blue') + 
ggtitle("All Reads-CB-4") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
d

e<- ggplot(data = rawreads.ac5, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac5$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac5$count)), color='blue') + 
ggtitle("All Reads-ac-5") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
e

png("~/Documents/AdmixtureMapping/figures/ac-demulti-run2.png", width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d,e, ncol=2)
dev.off()



###### AC run-2 lane 3

rawreads.ac1 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane3.AC-1.txt", header=FALSE)
rawreads.ac2 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane3.AC-2.txt", header=FALSE)
rawreads.ac3 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane3.AC-3.txt", header=FALSE)
rawreads.ac4 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane3.AC-4.txt", header=FALSE)
rawreads.ac5 <-read.csv ("~/Documents/AdmixtureMapping/summary_files/count.demultiplex.lane3.AC-5.txt", header=FALSE)

rawreads.ac1$lib <- c("ac-1")
rawreads.ac2$lib <- c("ac-2")
rawreads.ac3$lib <- c("ac-3")
rawreads.ac4$lib <- c("ac-4")
rawreads.ac5$lib <- c("ac-5")


colnames(rawreads.ac1) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac2) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac3) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac4) <- c("indiv","lane", "R1", "R2", "lib")
colnames(rawreads.ac5) <- c("indiv","lane", "R1", "R2", "lib")

rawreads.ac1$pop <- substring(rawreads.ac1$indiv, 1, 2)
rawreads.ac2$pop <- substring(rawreads.ac2$indiv, 1, 2)
rawreads.ac3$pop <- substring(rawreads.ac3$indiv, 1, 2)
rawreads.ac4$pop <- substring(rawreads.ac4$indiv, 1, 2)
rawreads.ac5$pop <- substring(rawreads.ac5$indiv, 1, 2)


rawreads.ac1$count <- rawreads.ac1$R1/4
rawreads.ac2$count <- rawreads.ac2$R1/4
rawreads.ac3$count <- rawreads.ac3$R1/4
rawreads.ac4$count <- rawreads.ac4$R1/4
rawreads.ac5$count <- rawreads.ac5$R1/4


#Raw 
a<- ggplot(data = rawreads.ac1, aes(y= count, x= indiv, fill=pop))+ 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac1$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac1$count)), color='blue') + 
ggtitle("All Reads-ac-1") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
a

b <- ggplot(data = rawreads.ac2, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac2$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac2$count)), color='blue') + 
ggtitle("All Reads-ac-2") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none")+ ylim(c(0, 2300000))
b

c <- ggplot(data = rawreads.ac3, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) + 
theme_bw() + geom_hline(yintercept = (mean(rawreads.ac3$count)), color='green') +
geom_hline(yintercept= (median(rawreads.ac3$count)), color='blue') + 
ggtitle("All Reads-ac-3") + ylab("Demultiplex Number of Reads") + xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000))
c

d<- ggplot(data = rawreads.ac4, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac4$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac4$count)), color='blue') + 
ggtitle("All Reads-CB-4") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
d

e<- ggplot(data = rawreads.ac5, aes(y= count, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') + 
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple")) +
theme_bw() + geom_hline(yintercept= (mean(rawreads.ac5$count)), color='green') + 
geom_hline(yintercept= (median(rawreads.ac5$count)), color='blue') + 
ggtitle("All Reads-ac-5") + ylab("Demultiplex Number of Reads")+ xlab("Individual") + 
theme(legend.position="none") + ylim(c(0, 2300000)) 
e

png("~/Documents/AdmixtureMapping/figures/ac-demulti-run2-lane3.png", width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d,e, ncol=2)
dev.off()




######## aligned reads ###############

###### all

CB1 <-read.csv ("alignment.count.all-CB-1.txt", header=FALSE)
CB2 <-read.csv ("alignment.count.all-CB-2.txt", header=FALSE)
CB3 <-read.csv ("alignment.count.all-CB-3.txt", header=FALSE)
CB4 <-read.csv ("alignment.count.all-CB-4.txt", header=FALSE)
CB1$lib <- c("CB-1")
CB2$lib <- c("CB-2")
CB3$lib <- c("CB-3")
CB4$lib <- c("CB-4")

colnames(CB1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB2) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB3) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB4) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")

CB1$pop <- substring(CB1$indiv, 1, 2)
CB2$pop <- substring(CB2$indiv, 1, 2)
CB3$pop <- substring(CB3$indiv, 1, 2)
CB4$pop <- substring(CB4$indiv, 1, 2)




#Raw 
a<- ggplot(data = CB1, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB1$real)), color='green') +
geom_hline(yintercept= (median(CB1$real)), color='blue') + 
ggtitle("Aligned Reads-CB-1") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1500000))
a

b <- ggplot(data = CB2, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB2$real)), color='green') +
geom_hline(yintercept= (median(CB2$real)), color='blue') + 
ggtitle("Aligned Reads-CB-2") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none")+ ylim(c(0, 1500000))
b

c <- ggplot(data = CB3, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB3$real)), color='green') +
geom_hline(yintercept= (median(CB3$real)), color='blue') + 
ggtitle("Aligned Reads-CB-3") + ylab("Aligned Number of Reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1500000))
c

d <- ggplot(data = CB4, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red","snow4", "black","white","blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB4$real[which(CB4$real > 8000)])), color='green') +
geom_hline(yintercept= (median(CB4$real[which(CB4$real > 8000)])), color='blue') + 
ggtitle("Aligned Reads-CB-4") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none")+ ylim(c(0, 1900000)) 
d


png("CB-all-aligned.png",  width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d, ncol=2)
dev.off()


###### renorm

CB1 <-read.csv ("alignment.count.renorm-CB-1.txt", header=FALSE)
CB2 <-read.csv ("alignment.count.renorm-CB-2.txt", header=FALSE)
CB3 <-read.csv ("alignment.count.renorm-CB-3.txt", header=FALSE)
CB4 <-read.csv ("alignment.count.renorm-CB-4.txt", header=FALSE)
CB1$lib <- c("CB-1")
CB2$lib <- c("CB-2")
CB3$lib <- c("CB-3")
CB4$lib <- c("CB-4")

colnames(CB1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB2) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB3) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB4) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")

CB1$pop <- substring(CB1$indiv, 1, 2)
CB2$pop <- substring(CB2$indiv, 1, 2)
CB3$pop <- substring(CB3$indiv, 1, 2)
CB4$pop <- substring(CB4$indiv, 1, 2)


a<- ggplot(data = CB1, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB1$real)), color='green') +
geom_hline(yintercept= (median(CB1$real)), color='blue') + 
ggtitle("Aligned Reads-renorm-CB-1") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1500000))
#a

b <- ggplot(data = CB2, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB2$real)), color='green') +
geom_hline(yintercept= (median(CB2$real)), color='blue') + 
ggtitle("Aligned Reads-renorm-CB-2") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none")+ ylim(c(0, 1500000))
#b

c <- ggplot(data = CB3, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB3$real)), color='green') +
geom_hline(yintercept= (median(CB3$real)), color='blue') + 
ggtitle("Aligned Reads-renorm-CB-3") + ylab("Aligned Number of Reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1500000))
#c

d <- ggplot(data = CB4, aes(y= real, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red","snow4", "black","white","blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB4$real[which(CB4$real > 8000)])), color='green') +
geom_hline(yintercept= (median(CB4$real[which(CB4$real > 8000)])), color='blue') + 
ggtitle("Aligned Reads-renorm-CB-4") + ylab("Aligned number of reads")+ xlab("Individual") +
theme(legend.position="none")+ ylim(c(0, 1500000)) 
#d


png("CB-renorm-aligned.png",  width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d, ncol=2)
dev.off()



######  Combined

setwd("~/Documents/AdmixtureMapping/summary_files")
CB1 <-read.csv ("alignment.count.all-CB-1.txt", header=FALSE)
CB2 <-read.csv ("alignment.count.all-CB-2.txt", header=FALSE)
CB3 <-read.csv ("alignment.count.all-CB-3.txt", header=FALSE)
CB4 <-read.csv ("alignment.count.all-CB-4.txt", header=FALSE)
CB1.1 <-read.csv ("alignment.count.renorm-CB-1.txt", header=FALSE)
CB2.1 <-read.csv ("alignment.count.renorm-CB-2.txt", header=FALSE)
CB3.1 <-read.csv ("alignment.count.renorm-CB-3.txt", header=FALSE)
CB4.1 <-read.csv ("alignment.count.renorm-CB-4.txt", header=FALSE)

colnames(CB1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB2) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB3) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB4) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB1.1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB2.1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB3.1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(CB4.1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")



CB1.2 <- data.frame(CB1[,1])
CB2.2 <- data.frame(CB2[,1])
CB3.2 <- data.frame(CB3[,1])
CB4.2 <- data.frame(CB4[,1])

colnames(CB1.2) <- c("indiv")
colnames(CB2.2) <- c("indiv")
colnames(CB3.2) <- c("indiv")
colnames(CB4.2) <- c("indiv")

CB1.2$total <- CB1$real + CB1.1$real
CB2.2$total <- CB2$real + CB2.1$real
CB3.2$total <- CB3$real + CB3.1$real
CB4.2$total <- CB4$real + CB4.1$real


CB1.2$pop <- substring(CB1$indiv, 1, 2)
CB2.2$pop <- substring(CB2$indiv, 1, 2)
CB3.2$pop <- substring(CB3$indiv, 1, 2)
CB4.2$pop <- substring(CB4$indiv, 1, 2)


a<- ggplot(data = CB1.2, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB1.2$total)), color='green') +
geom_hline(yintercept= (median(CB1.2$total)), color='blue') + 
ggtitle("Combined aligned reads CB-1") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1900000))
#a

b <- ggplot(data = CB2.2, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB2.2$total)), color='green') +
geom_hline(yintercept= (median(CB2.2$total)), color='blue') + 
ggtitle("Combined aligned reads CB-2") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1900000))
#b

c <- ggplot(data = CB3.2, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB3.2$total)), color='green') +
geom_hline(yintercept= (median(CB3.2$total)), color='blue') + 
ggtitle("Combined aligned reads CB-3") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1900000))
#c

d <- ggplot(data = CB4.2, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red","snow4", "black","white","blue", "springgreen4"))+ theme_bw() + 
geom_hline(yintercept= (mean(CB4.2$total[which(CB4.2$total > 8000)])), color='green') +
geom_hline(yintercept= (median(CB4.2$total[which(CB4.2$total > 8000)])), color='blue') + 
ggtitle("Combined aligned reads-renorm-CB-4") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0, 1900000)) 
#d


png("~/Documents/AdmixtureMapping/summary_files/CB-combined-aligned.png",  width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d, ncol=2)
dev.off()


############# AC run 1 #############

AC1 <-read.csv ("alignment.count.all-AC-1.txt", header=FALSE)
AC2 <-read.csv ("alignment.count.all-AC-2.txt", header=FALSE)
AC3 <-read.csv ("alignment.count.all-AC-3.txt", header=FALSE)
AC4 <-read.csv ("alignment.count.all-AC-4.txt", header=FALSE)
AC5 <-read.csv ("alignment.count.all-AC-5.txt", header=FALSE)

colnames(AC1) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(AC2) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(AC3) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(AC4) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")
colnames(AC5) <- c("indiv" ,"mapped", "unmapped", "pcr", "total", "real")

AC1$pop <- substring(AC1$indiv, 1, 2)
AC2$pop <- substring(AC2$indiv, 1, 2)
AC3$pop <- substring(AC3$indiv, 1, 2)
AC4$pop <- substring(AC4$indiv, 1, 2)
AC5$pop <- substring(AC5$indiv, 1, 2)


a<- ggplot(data = AC1, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC1$real)), color='green') +
geom_hline(yintercept= (median(AC1$real)), color='blue') + 
ggtitle("Combined aligned reads AC-1") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0,5000000))
#a

b<- ggplot(data = AC2, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC2$real)), color='green') +
geom_hline(yintercept= (median(AC2$real)), color='blue') + 
ggtitle("Combined aligned reads AC-2") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0,5000000))
#b

c <- ggplot(data = AC3, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC3$real)), color='green') +
geom_hline(yintercept= (median(AC3$real)), color='blue') + 
ggtitle("Combined aligned reads AC-3") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0,5000000))
#c

d <- ggplot(data = AC4, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC4$real)), color='green') +
geom_hline(yintercept= (median(AC4$real)), color='blue') + 
ggtitle("Combined aligned reads AC-4") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0,5000000))
#d

e <- ggplot(data = AC5, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC5$real)), color='green') +
geom_hline(yintercept= (median(AC5$real)), color='blue') + 
ggtitle("Combined aligned reads AC-5") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none") + ylim(c(0,5000000))
#e

png("~/Documents/AdmixtureMapping/figures/AC-run1-aligned.png",  width = 2000, height=1500, units='px', res=150)
grid.arrange(a,b,c,d,e, ncol=2)
dev.off()


########## AC combined

AC <- read.csv ("~/Documents/AdmixtureMapping/summary_files/count.aligned.combined-AC.txt", header=FALSE)
colnames(AC) <- c("pop", "indiv",)

colnames(AC) <- c("pop","indiv" ,"mapped", "unmapped", "pcr", "total", "real")


a<- ggplot(data = AC, aes(y= total, x= indiv, fill=pop)) + 
geom_bar(stat='identity', color='black', position='dodge') +
scale_fill_manual(values=c("red", "blue", "springgreen4", "orange", "purple"))+ theme_bw() + 
geom_hline(yintercept= (mean(AC$real)), color='green') +
geom_hline(yintercept= (median(AC$real)), color='blue') + 
ggtitle("Combined aligned reads AC all") + ylab("Combined number of reads")+ xlab("Individual") +
theme(legend.position="none")
a

png("~/Documents/AdmixtureMapping/figures/AC-combined-aligned.png",  width = 2000, height=1500, units='px', res=150)
a
dev.off()






\