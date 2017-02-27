library(genepopedit)

#CB pops
#GenePop <- data.table::fread("/home/rsbrenna/admixture_mapping/variants/bgc/CB.genepop",header=FALSE, sep="\t",stringsAsFactors=FALSE, showProgress=FALSE)

#check that pop names are coming out alright
#PopNames <- genepop_detective(GenePop, variable="Pops")

#specify which populations are going to be included in the analysis and to which class they belong. Note Pops identified in P1 and-or P2 can also be specified as "Admixed" to test BGC output. 
#BGC_groups = data.frame(pops = c("PP","AF","PL"),groups = c("P1","Admixed","P2"))

#convert Genepop to BGC input files (3). 
#Note in this case the variable path is a path to the directory where the input files will be saved.
#genepop_bgc(genepop=GenePop,popdef = BGC_groups, fname="bgc_CB",path = "~/admixture_mapping/variants/bgc/")


#AC pops
GenePop <- data.table::fread("/home/rsbrenna/admixture_mapping/variants/bgc/AC.genepop",header=FALSE, sep="\t",stringsAsFactors=FALSE, showProgress=TRUE)

#check that pop names are coming out alright
PopNames <- genepop_detective(GenePop, variable="Pops")

#specify which populations are going to be included in the analysis and to which class they belong. Note Pops identified in P1 and-or P2 can also be specified as "Admixed" to test BGC output. 
BGC_groups = data.frame(pops = c("PC","BC","HP"),groups = c("P1","Admixed","P2"))

#convert Genepop to BGC input files (3). 
#Note in this case the variable path is a path to the directory where the input files will be saved.
genepop_bgc(genepop=GenePop,popdef = BGC_groups, fname="bgc_AC",path = "~/admixture_mapping/variants/bgc/")
