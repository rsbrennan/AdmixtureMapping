library(ape)
mytree <- read.tree(file.choose("N_S_remove.tree"))   # newick format
plot(mytree, cex=0.7)

#order is pc bc hp pl af pp
mycol<-c("skyblue1","skyblue1", "skyblue1", "red", "red", "red")

png("nj.N_S_remove.png",h=1000, w=1000, pointsize=20 )
plot(mytree, type="unrooted", 
         show.tip.label=FALSE,
         edge.width=3,
         edge.color="black",
         adj=0.5, label.offset=1.5, lwd=2.5)
tiplabels(pch=21, col="black",adj=0.5, bg=mycol, cex=4)
tiplabels(mytree$tip.label,col="black", adj=0.3,bg=mycol, frame="none")
dev.off()
