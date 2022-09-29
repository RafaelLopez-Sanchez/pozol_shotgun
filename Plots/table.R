#/usr/local/bin/R
matrix_abund
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
@author: Rafael López-Sánchez
#This script was created for  getting the table of abundances of pozol's bacteria with at least 1% of abundance at one time of fermentation in metagenome at the phylum and genus level
"""
#####PHYLUM LEVEL#######################
phylum_table<-read.table("phylum_abund.txt", header=TRUE, row.names=1, fill = TRUE)#Transpose the tablephylum_table=t(phylum_table)mydata <- as.data.frame(phylum_table)maxab <- apply(mydata, 2, max)n1 <- names(which(maxab < 1))data.prop.1 <- mydata[, -which(names(mydata) %in% n1)]data.prop.1 <- t(data.prop.1)write.table(data.prop.1,file = "phylum_matrix.txt", row.names = TRUE, sep = "\t")


####### GENUS LEVEL #############################
genus_table<-read.table("genus_abund.txt", header=TRUE, row.names=1, fill = TRUE)#Transpose the tablegenus_table=t(genus_table)mydata <- as.data.frame(genus_table)maxab <- apply(mydata, 2, max)n1 <- names(which(maxab < 1))data.prop.1 <- mydata[, -which(names(mydata) %in% n1)]data.prop.1 <- t(data.prop.1)write.table(data.prop.1,file = "genus_matrix.txt", row.names = TRUE, sep = "\t")