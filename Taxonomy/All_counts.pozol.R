## ---------------------------
##
## Script name: TABLE FOR ABUNDANCE OF ALL GENERA IN POZOL FERMENTATION
##
##
## Author: Rafael López-Sánchez
##
## Date Created: 2023-01-05
##
## Copyright (c) Rafael, López-Sánchez 2023
## Email: rafael.lopez@ibt.unam.mx
##
## ---------------------------
##
## Notes: This script is to get all read counts for genera in pozol. 
##   
##
## ---------------------------

## set working directory for Mac.

setwd("/Users/rafaellopezsanchez/Desktop") # Rafa's working directory (mac)

Genus=read.table('genus.report.txt', header=TRUE, row.names=1, sep="\t")

#Get the percentage of reads in all the metagenome
all_Genus=rowSums(Genus)
all_counts=sum(all_Genus)
all_Genus=(all_Genus/all_counts)*100

#Write the normalized matrix to make the heatmap.
write.table(all_Genus, file="genus_all_pozol.txt", sep="\t", quote=F, col.names=NA)
