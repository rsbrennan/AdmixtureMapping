#### all of the following is modified from QQman


    # Create a new data.frame with columns called CHR, BP, and P.
    d=data.frame(CHR=pp.pl$CHR, BP=pp.pl$BP, P=pp.pl$fst)
    
    # If the input data frame has a SNP column, add it to the new data frame you're creating.    
    # Set positions, ticks, and labels for plotting
    ## Sort and keep only values where is numeric.
    #d <- subset(d[order(d$CHR, d$BP), ], (P>0 & P<=1 & is.numeric(P)))
    d <- subset(d, (is.numeric(CHR) & is.numeric(BP) & is.numeric(P)))
    d <- d[order(d$CHR, d$BP), ]
    #d$logp <- ifelse(logp, yes=-log10(d$P), no=d$P)

    d$pos=NA
    
    # Fixes the bug where one chromosome is missing by adding a sequential index column.
    d$index=NA
    ind = 0
    for (i in unique(d$CHR)){
        ind = ind + 1
        d[d$CHR==i,]$index = ind
    }
    
    nchr = length(unique(d$CHR))
    if (nchr==1) {
        d$pos=d$BP
        ticks=floor(length(d$pos))/2+1
        xlabel = paste('Chromosome',unique(d$CHR),'position')
        labs = ticks
    } else { ## For multiple chromosomes
        lastbase=0
        ticks=NULL
        for (i in unique(d$index)) {
            if (i==1) {
                d[d$index==i, ]$pos=d[d$index==i, ]$BP
            } else {
                lastbase=lastbase+tail(subset(d,index==i-1)$BP, 1)
                d[d$index==i, ]$pos=d[d$index==i, ]$BP+lastbase
            }
            ticks = c(ticks, (min(d[d$index == i,]$pos) + max(d[d$index == i,]$pos))/2 + 1)
        }
        xlabel = 'Chromosome'
        labs <- unique(d$CHR)
    }


#sliding window average of fst values

win.size <- 200000
out <- matrix(ncol=5)
for(chr in chroms){
    len <- which(d$CHR == chr)
    a <- d[len,]
    for(i in seq(1, nrow(a), 20)){
        if(a$BP[i]+win.size < a$BP[nrow(a)]){
            val <- a$BP[i] + win.size
            window <- which(a$BP >= a$BP[i] & a$BP<=val)
            if(length(window) >5){
                avg <- c(chr, i, a$pos[i], length(window),(mean(na.omit(a$P[window]))))
                out <- rbind(out, avg)
            }
        }
    }

}

out <- as.data.frame(out)
colnames(out) <- c("CHR","index" ,"BP", "n_snps", "avg")


#plot sliding windwo
chroms <- unique(d$CHR)
for(chr in chroms){
    len <- which(out$CHR == chr)
    points(x=out$BP[len], y=out$avg[len],pch=19, col="deepskyblue", cex=0.2)
}


#Do loess regression
chroms <- unique(d$CHR)
for(chr in chroms){
    len <- which(d$CHR == chr)
    lr <- loess(d$P[len] ~ d$pos[len]) 
    pos <- d$pos[len]
    pos.1 <- pos[!is.na(d$P[len])] 
    lines(x=pos.1, y=lr$fitted, col="red", lwd=1.5)
}
    

