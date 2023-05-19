#/usr/local/bin/R
phylum_abund
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
@author: Rafael López-Sánchez
#This script was created for abundances of pozol's bacteria fermentation metagenome at the phylum level
"""
library(randomcoloR)
phyla_table<-read.table("phylum_matrix.txt", header=TRUE, row.names=1)
n<-5
my_color=distinctColorPalette(n)
# Convert cm to inches
width_in <- 20.5 * 0.393701
height_in <- 20.5 * 0.393701

# Create the PDF file
pdf("FigureS1.pdf", width=width_in, height=height_in, pointsize = 4)
par(mar=c(8,12,8,40))

par(mar=c(8,12,8,40))
barplot(as.matrix(phyla_table), 
	col=my_color, 
	cex.axis=2.4, 
	cex.lab=3.0, 
	cex.names=2.4, 
	las=0.4,   
	ylab="Relative abundance (%)", 
	xlab="Fermentation Time", 
	legend.text=TRUE, 
	args.legend = list(x=ncol(phyla_table)+5, 
	y=max(colSums(phyla_table)), 
	cex=2.0))
dev.off()
