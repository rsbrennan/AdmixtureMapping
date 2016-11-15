read.table("test.out.snpden", header=TRUE) -> dat

a <- mean(dat$VARIANTS.KB)

cat (a, "\n", file="out.txt", append=TRUE)
