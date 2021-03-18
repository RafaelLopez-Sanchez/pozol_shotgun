#/usr/local/bin/R
phylum_abund
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
@author: Rafael López-Sánchez
#This script was created for abundances of pozol's bacteria fermentation metagenome at the phylum level
"""
phyla_table<-read.table("phylum_abund.txt", header=TRUE, row.names=1)
color = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
my_color=c(sample(color, 100))
png("phyla.png", width = 1000, height = 950, res = 300, pointsize = 4)
par(mar=c(10,8,4,20))
barplot(as.matrix(phyla_table), col=my_color, cex.axis=1.8, cex.lab=2.0, cex.names=1.8, las=0.4,   ylab="Relative abundance (%)", xlab="Fermentation Time", legend.text=TRUE, args.legend = list(x=ncol(phyla_table)+4, y=max(colSums(phyla_table)), cex=1.5))
dev.off()



