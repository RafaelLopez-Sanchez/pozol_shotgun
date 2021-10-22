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
genus_table<-read.table("genus_abund.txt", header=TRUE, row.names=1)
n<-23
my_color=distinctColorPalette(n)
tiff("genus.tiff",  units="cm", width=8.5, height=10.5, res=300, pointsize = 4)
par(mar=c(10,8,4,20))
barplot(as.matrix(genus_table), 
	col=my_color, 
	cex.axis=1.8, 
	cex.lab=2.0, 
	cex.names=1.8, 
	las=0.4,   
	ylab="Relative abundance (%)", 
	xlab="Fermentation Time", 
	legend.text=TRUE, 
	args.legend = list(x=ncol(genus_table)+4, 
	y=max(colSums(genus_table)), 
	cex=1.5))
dev.off()



