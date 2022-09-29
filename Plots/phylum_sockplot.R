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
png("phyla.png", width = 2000, height = 2000, res = 600, pointsize = 4)
par(mar=c(10,8,4,20))
barplot(as.matrix(phyla_table), col=my_color, cex.axis=1.8, cex.lab=2.0, cex.names=1.8, las=0.4,   ylab="Relative abundance (%)", xlab="Fermentation Time", legend.text=TRUE, args.legend = list(x=ncol(phyla_table)+4, y=max(colSums(phyla_table)), cex=1.5))
dev.off()



