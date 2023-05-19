#/usr/local/bin/R
genus_abund
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
@author: Rafael López-Sánchez
#This script was created for abundances of pozol's bacteria fermentation metagenome at the genus level
"""
library(randomcoloR)
genus_table <- read.table("genus_matrix.txt", header=TRUE, row.names=1)
n <- 26
my_color = distinctColorPalette(n)

# Convert cm to inches
width_in <- 20.5 * 0.393701
height_in <- 20.5 * 0.393701

# Create the PDF file
pdf("Figure 2a.pdf", width=width_in, height=height_in, pointsize = 4)

par(mar=c(8,12,8,40))
barplot(as.matrix(genus_table), 
	col=my_color, 
	cex.axis=2.4, 
	cex.lab=3.0, 
	cex.names=2.4, 
	las=0.4,   
	ylab="Relative abundance (%)", 
	xlab="Fermentation Time", 
	legend.text=TRUE, 
	args.legend = list(x=ncol(genus_table)+5, 
	y=max(colSums(genus_table)), 
	cex=2.0))
dev.off()




