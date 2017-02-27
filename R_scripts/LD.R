```r
dat <- read.table("~/admixture_mapping/variants/cb-all.70.map", header=FALSE)
colnames(dat) <- c("chr", "snp", "na", "bp")
dat$dist <- c("NA")
dat$bp <- as.numeric(dat$bp)

chr <- unique(dat$chr)

for (i in 1:(length(chr))) {
	a <-which(dat$chr == chr[i] )
	new <- dat[a,]
	for (count in 1:(nrow(new)-1)){
		dat$dist[a[count]] <- new$bp[count+1]-new$bp[count]
	}
}

a <- dat$dist[which(dat$dist != "NA")]
a <- as.numeric(a)
sum(((a[which(a < 40000)])))
sum(((a[which(a > 20000)])))

length(which((a) > 40000))

138,534,201 less than 20kb
```

Assuming 40kb
- snps are a mean of 34kb apart (excluding those that are <2kb apart, ie, not on same rad site).
- median of 20kb apart.

total distance: 863,720,645 bp

7212 > 40kb apart:   
- total distance of variants less than 40kb apart: 290,193,173
- Assuming ld extends 40 kb include 288,480,000 bp from those >40kb apart
- 578,673,173 bp covered
- total missing: 371,278,523
- % included = 67.0.0%

12916 > 20 kb apart
- total distance of variants less than 20kb apart:125,908,531
- Assuming ld extends 22 kb include 258,320,000 bp from those >20kb apart
- 384,228,531 bp covered
- % included = 44.4%


### Determine proportion of genome covered by exons, introns, genes, etc

```bash
#exon file
cat ~/reference/heteroclitus_000826765.1_3.0.2_genomic.gff | awk 'BEGIN{OFS="\t";} $3=="exon" {print $1,$4-1,$5}' | ~/bin/bedtools2/bin/sortBed | ~/bin/bedtools2/bin/mergeBed -i -  > exon.bed

#introns
cat ~/reference/heteroclitus_000826765.1_3.0.2_genomic.gff | awk 'BEGIN{OFS="\t";} $3=="gene" {print $1,$4-1,$5}' | ~/bin/bedtools2/bin/sortBed | ~/bin/bedtools2/bin/subtractBed -a stdin -b exon.bed  > intron.bed

#let's intersect the two files
#this shouldn't produce any output
intersectBed -a exon.bed -b intron.bed

#find intergeneic regions
cat ~/reference/heteroclitus_000826765.1_3.0.2_genomic.gff | awk 'BEGIN{OFS="\t";} $3=="gene" {print $1,$4-1,$5}' | ~/bin/bedtools2/bin/sortBed | ~/bin/bedtools2/bin/complementBed -i stdin -g ~/reference/heteroclitus_000826765.1_3.0.2_genomic.fa.fai >intergenic.bed


```

### Look at genes included using LD

print gff overlap

```bash

cut -f 1-9 ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.gff > ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff


zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-20000,$2+20000}}' | awk '{if ($2 > 0) print $0}' | bedtools intersect -a stdin -b ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff -wb | cut -f 4- | sort | uniq > 20kb.list
zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-40000,$2+40000}}' | awk '{if ($2 > 0) print $0}' | bedtools intersect -a stdin -b ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff -wb | cut -f 4- | sort | uniq > 40kb.list
zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-1,$2}}' | awk '{if ($2 > 0) print $0}' | bedtools intersect -a stdin -b ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff -wb | cut -f 4- | sort | uniq > snp.only.list

bedtools intersect -a ~/reference/SbfI_List.bed  -b ~/reference/heteroclitus_000826765.1_3.0.2_genomic.gff -wb | cut -f 4- | sort | uniq > sbf.out

cat ~/reference/SbfI_List.bed  |awk '{OFS="\t"; {print $1,$2-20000,$3+20000}}' | awk '{if ($2 > 0) print $0}' | bedtools intersect -a stdin -b ~/reference/heteroclitus_000826765.1_3.0.2_genomic.gff -wb | cut -f 4- | sort | uniq > sbf.20.out
```

print out genes only

```bash
cat ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff| awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| sort | cut -c 6- | sed 's/;//g' > all.gene.list
cat 20kb.list | awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| grep -ohP "gene=.*?;" | sort | uniq | cut -c 6- | sed 's/;//g' > 20kb.gene.list
cat 40kb.list | awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| grep -ohP "gene=.*?;" | sort | uniq | cut -c 6- | sed 's/;//g' > 40kb.gene.list
cat snp.only.list |awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| grep -ohP "gene=.*?;" | sort | uniq | cut -c 6- | sed 's/;//g' > snp.gene.list
cat sbf.20.out |awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| grep -ohP "gene=.*?;" | sort | uniq | cut -c 6- | sed 's/;//g' > snp.20.gene.list
cat sbf.out | awk 'BEGIN{OFS="\t";} $3=="gene" {print $0}'| grep -ohP "gene=.*?;" | sort | uniq | cut -c 6- | sed 's/;//g' > sbf.gene.list

cat ~/reference/heteroclitus_000826765.1_3.0.2_genomic.chr.1.gff| awk '$3 == "gene" {OFS="\t";print $1,$4-1,$5}' > all.genes
zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-1,$2}}' | awk '{if ($2 > 0) print $0}' > snps.genes
zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-20000,$2+20000}}' | awk '{if ($2 > 0) print $0}' > 20.kb
zcat ~/admixture_mapping/variants/cb-all.70.chrom.vcf.gz| awk '{OFS="\t"; if (!/^#/){print $1,$2-40000,$2+40000}}' | awk '{if ($2 > 0) print $0}' > 40.kb
```

```r

genes <- read.table("genes.txt", header=FALSE)
kb.40 <- read.table("~/admixture_mapping/scripts/40kb.gene.list", header=FALSE)
kb.20 <- read.table("~/admixture_mapping/scripts/20kb.gene.list", header=FALSE)
all.genes <- read.table("~/admixture_mapping/scripts/all.genes", header=FALSE)
snp.genes <- read.table("~/admixture_mapping/scripts/snp.gene.list", header=FALSE)
sbf <- read.table("sbf.gene.list", header=FALSE)
sbf.20 <- read.table ("snp.20.gene.list", header=FALSE)
all.genes <- as.vector(t(all.genes))
kb.20 <- as.vector(t(kb.20))
kb.40 <- as.vector(t(kb.40))
snp.genes <- as.vector(t(snp.genes))
sbf <- as.vector(t(sbf))
sbf.20 <- as.vector(t(sbf.20))

pdf("genesincluded.pdf", h=7, w=10)
dat <- c(nrow(all.genes),length(kb.40), length(kb.20), length(sbf.20), length(sbf), length(snp.genes) )
bp <- barplot(dat,
	names.arg=c("Total genes", "40kb", "20kb", "pred. 20kb", "pred. snps", "snps only"))
text(bp,0,dat, pos=3)
dev.off()


#### Plot distrubtion of the fragments

library(Sushi)

test <- read.table("20.kb", header=FALSE)
test1 <- read.table("40.kb", header=FALSE)
snps <- read.table("snps.genes", header=FALSE)
genes <- read.table("all.genes", header=FALSE)
colnames(test) <- c("chrom", "start", "end")
colnames(test1) <- c("chrom", "start", "end")
colnames(genes) <- c("chrom", "start", "end")
colnames(snps) <- c("chrom", "start", "end")

genes$row <- c(1)
test$row <- c(3)
test1$row <- c(2)
snps$row <- c(4)
test$color <- c("red")
test1$color <- c("blue")
genes$color <- c("black")
snps$color <- c("darkgreen")

dat <- rbind(test, test1)
dat <- rbind(dat, genes)
dat <- rbind(dat, snps)

chrom = "chr1"
chromstart = 1
chromend = 5000000
#chromend= max(dat$end[which(dat$chrom == chrom)])
pdf("den.2.pdf", width=10, height=4)
plotBed(beddata = dat, chrom= chrom, chromstart= chromstart, chromend= chromend , type = "region", color= dat$color,rownumber=dat$row, row="given", plotbg="grey95")
labelgenome(chrom,chromstart,chromend,n=4)
dev.off()

```