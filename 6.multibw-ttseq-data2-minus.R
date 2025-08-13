#r code to change 0 to NA and remove NA (for multibigwig fold quantification)
setwd("H:/My Drive/nenG-Lab/1.Pawel/1.bioinformatics/Bioinformatics_r/multibw/ttseq-anna-data2")
getwd()
library(dplyr)

#read delim (minus strand)
allchr = read.delim("ttseq_noscale_cpm_rev-data2-minus.tab")
head(allchr)
colnames(allchr)

#change col names
#make condition names variable - check order in the tab
conds = c("c1_1","c5_1", "c1_2", "c5_2")
conds_minus = paste(conds, "minus", sep = "_")

#change col names 
chr_sxx_names = c("chr", "start", "end", conds_minus)
chr_sxx_names
colnames(allchr) = chr_sxx_names
colnames(allchr)
head(allchr)

#change zero to NA & remove
allchr[allchr==0] = 1e-20
allchr
allchr_nozero = allchr[complete.cases(allchr),]
head(allchr_nozero)
#as numeric
str(allchr_nozero)
allchr_nozero[,c(2:length(allchr_nozero))] = sapply(allchr_nozero[,c(2:length(allchr_nozero))], as.numeric)
str(allchr_nozero)

#annotation
ref = read.delim("minus-rev_grch38_114_norRNA_gene-feature.bed", sep = "\t", header = F)
head(ref)
str(ref)
colnames(ref) = c("chr", "start", "end", "strand", "ensembl_id", "gene_name", "gene_type", "gene_type2")
head(ref)
ref[,c(2,3)] = sapply(ref[,c(2,3)], as.numeric)
allchr_annot = merge(x = allchr_nozero, y = ref, by.x = c("chr", "start", "end"), by.y = c("chr", "start", "end"))
allchr_annot

#export csv
multibw = as.data.frame(allchr_annot)
head(multibw)
write.csv(multibw, "ttseq-data2-minus-rev.csv")

