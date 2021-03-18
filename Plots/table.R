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
phylum_table<-read.table("matrix_abund.txt", header=TRUE, row.names=1, fill = TRUE)


####### GENUS LEVEL #############################
genus_table<-read.table("matrix_abund.txt", header=TRUE, row.names=1, fill = TRUE)