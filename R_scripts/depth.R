
#to get fread installed correctly. With fill option.
#remove.packages("data.table")
#install.packages("data.table", type = "source",
#    repos = "http://Rdatatable.github.io/data.table",
#    INSTALL_opts = c('--no-lock'))

library(data.table)
#packageVersion("data.table")

####### AC pops #######

bc <- fread ("BC.bam.hist.all.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)
ga <- fread ("~/admixture_mapping/summary_files/GA.bam.hist.all.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)
hp <- fread ("HP.bam.hist.all.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)
pc <- fread ("PC.bam.hist.all.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)
tr <- fread ("TR.bam.hist.all.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)

bc <- as.data.frame(bc)
ga <- as.data.frame(ga)
hp <- as.data.frame(hp)
pc <- as.data.frame(pc)
tr <- as.data.frame(tr)
bc$depth <- bc$V5/318 
ga$depth <- ga$V5/25 
hp$depth <- hp$V5/46 
pc$depth <- pc$V5/46 
tr$depth <- tr$V5/45 

png("AC-pops.png",h=1000, w=1000, pointsize=20)
hist(bc$depth, freq=FALSE, breaks=1000, xlim=c(1,60), ylim=c(0,0.05), col=rgb(0,0,0,.3), main="Coverage across first 134 bp", xlab= "Depth")
hist(ga$depth,freq=FALSE, breaks=1000, xlim=c(1,150), col=rgb(0,0,1,0.3), add=T)
hist(hp$depth,freq=FALSE, breaks=1000, xlim=c(1,150), col=rgb(0,1,0,0.3), add=T)
hist(pc$depth,freq=FALSE, breaks=1000, xlim=d(1,150), col=rgb(1,0,0, 0.3), add=T)
hist(tr$depth,freq=FALSE, breaks=1000, xlim=d(1,150), col=rgb(0,1,1, 0.3), add=T)
dev.off()
legend(80, 0.04, c("All","AF", "PL", "PP"),cex=1.2, pch=15, col=c("grey", "blue", "green", "red"))


getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

out <- c()

#subsample to find mean depths
for (i in 1:10000){
	samp <- sample(tr$depth, 100000, replace=TRUE)
	avg <- mean(samp, na.rm=TRUE)
	out[i] <- avg
	}

mean(out, na.rm=TRUE)
median(out, na.rm=TRUE)

a <- fread ("BC-073-029.rad.depth.txt", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)
b <- fread ("AF.depth.out", header=FALSE, showProgress=TRUE, fill=TRUE, nrows=6000000)

a <- as.data.frame(a)
b <- as.data.frame(b)

c <- rowSums(a)
d <- rowSums(b)
e <- data.frame(PP_PL=c, AF=d)
e$total <- rowSums(e)
e$all <- e$total/(ncol(a)+ncol(b))
e$AF_avg <- e$AF/(ncol(b))
e$PL_avg <- (rowSums(a[,1:40])/40)
e$PP_avg <- (rowSums(a[,41:80])/40)

PL <- as.vector(t(a[,1:40]))
PP <- as.vector(t(a[,41:80]))
AF <- as.vector(t(b))
all.dat <- cbind(a[2000000:5000000,], b[2000000:5000000,])
all.dat1 <- as.vector(t(all.dat))

PL.1 <- as.numeric(PL)
PP.1 <- as.numeric(PP)
AF.1 <- as.numeric(AF)

getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

out <- c()

#subsample to find mean depths
for (i in 1:10000){
	samp <- sample(AF.1, 100000, replace=TRUE)
	avg <- mean(samp, na.rm=TRUE)
	out[i] <- avg
	}

mean(out, na.rm=TRUE)
median(out, na.rm=TRUE)

mean(as.numeric((as.matrix(all.dat))))
median(as.vector(all.dat))
max(all.dat.1)

mean(PL.1)

##### make histogram of depths

png("depth.reads.png", h=1000, w=1000, pointsize=20)

#hist(b[,1], freq=FALSE, breaks=1000, xlim=c(1,150), col=rgb(1,0,0,0.3), ylim=c(0,.05), main="Coverage across first 134 bp", xlab= "Depth")

hist(bc$depth, freq=FALSE, breaks=1000, xlim=c(1,100), col=rgb(0,0,0,.3), main="Coverage across first 134 bp", xlab= "Depth")
hist(hp$depth,freq=FALSE, breaks=1000, xlim=c(1,150), col=rgb(0,0,1,0.3), add=T)
hist(pc$depth,freq=FALSE, breaks=1000, xlim=c(1,150), col=rgb(0,1,0,0.3), add=T)
hist(tr$depth,freq=FALSE, breaks=1000, xlim=d(1,150), col=rgb(1,0,0, 0.3), add=T)

legend(80, 0.04, c("All","AF", "PL", "PP"),cex=1.2, pch=15, col=c("grey", "blue", "green", "red"))
dev.off()