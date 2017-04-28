#check agreement between different mg runs

snp_files <- list.files(pattern = "BC.*.5.100.snpinfo.txt")
names(snp_files) <- matrix(unlist(strsplit(snp_files, "\\.")), ncol=6, byrow=TRUE)[,2]
snp_list <- lapply(snp_files, read.table, header=TRUE)
names(snp_list)

filelist = list.files(pattern = "all.*.combined.txt")
names(filelist) <- matrix(unlist(strsplit(filelist, "\\.")), ncol=4, byrow=TRUE)[,2]
data_list = lapply(filelist, scan)
data_format = lapply(data_list, dim(x)=c(2, (nrow(snp)), 248);)


nams <- names(data_list)
for (i in 1:length(filelist)){
	snp.name <- snp_list[[nams[i]]]
	dim(data_list[[nams[i]]])=c(2, nrow(snp.name), 565);

}

data_list[[1]][1:2, 1:10, 1:5]

plot(y= chr1.100.1[1,,1], x= snp.1$pos,type='l',lwd=.5)
points(y=chr1.100.2[1,,1], x=snp.1$pos,type='l', col='blue', lwd=.5)
points(y=chr1.100.3[1,,1], x=snp.1$pos,type='l', col='red', lwd=.5)
points(y=chr1.100[1,,2], x=snp.1$pos,type='l', col='green', lwd=.5)


##### Calculate variance:
chr1.1=scan("chr1.1.ps21.txt");
dim(chr1.1)=c(2, nrow(snp.1), 248);
chr1.2=scan("chr1.2.ps21.txt");
dim(chr1.2)=c(2, nrow(snp.1), 248);
chr1.3=scan("chr1.3.ps21.txt");
dim(chr1.3)=c(2, nrow(snp.1), 248);
chr1.4=scan("chr1.4.ps21.txt");
dim(chr1.4)=c(2, nrow(snp.1), 248);
chr1.5=scan("chr1.5.ps21.txt");
dim(chr1.5)=c(2, nrow(snp.1), 248);

chr1.1.100=scan("chr1.1.ps21.txt");
dim(chr1.1.100)=c(2, nrow(snp.1), 248);
chr1.2.100=scan("chr1.2.ps21.txt");
dim(chr1.2.100)=c(2, nrow(snp.1), 248);
chr1.3.100=scan("chr1.3.ps21.txt");
dim(chr1.3.100)=c(2, nrow(snp.1), 248);
chr1.4.100=scan("chr1.4.ps21.txt");
dim(chr1.4.100)=c(2, nrow(snp.1), 248);
chr1.5.100=scan("chr1.5.ps21.txt");
dim(chr1.5.100)=c(2, nrow(snp.1), 248);

#plot all separately
plot(y= chr1.1[1,,1], x= snp.1$pos,type='l',lwd=.5)
points(y=chr1.2[1,,1], x=snp.1$pos,type='l', col='blue', lwd=.5)
points(y=chr1.3[1,,1], x=snp.1$pos,type='l', col='red', lwd=.5)
points(y=chr1.4[1,,1], x=snp.1$pos,type='l', col='green', lwd=.5)
points(y=chr1.5[1,,1], x=snp.1$pos,type='l', col='purple', lwd=.5)


new <- rbind(chr1.1[1,,1], chr1.2[1,,1], chr1.3[1,,1], chr1.4[1,,1], chr1.5[1,,1] )
out <- apply(new, 2, var)
low <- chr1[1,,1]- out
high <- chr1[1,,1]+ out

new.100 <- rbind(chr1.1.100 [1,,1], chr1.2.100 [1,,1], chr1.3.100 [1,,1], chr1.4.100 [1,,1], chr1.5.100 [1,,1] )
out.100  <- apply(new.100 , 2, var)
low.100  <- chr1.100 [1,,1]- out
high.100  <- chr1.100 [1,,1]+ out

polygon(c(snp.1$pos,rev(snp.1$pos)),c(low,rev(high)),col = "grey75", border = FALSE)
lines(y=chr1[1,,1], x=snp.1$pos,type='l', col='blue', lwd=.5)
polygon(c(snp.1$pos,rev(snp.1$pos)),c(low.100,rev(high.100)),col = "grey75", border = FALSE)
lines(y=chr1.100[1,,1], x=snp.1$pos,type='l', col='red', lwd=.5)
