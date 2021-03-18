#/usr/local/bin/R
CAZy_abund heatmap plot
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 15 21:08:43 2021
@author: Diana Hernández-Oaxaca
#This script was created for cazy families per substrate plot of pozol fermentation metagenome
For more details contact to: https://github.com/DianaOaxaca
"""
# Loading the required libraries
library(pracma)
library(vegan)
library(gplots)
library(RColorBrewer)
library(Heatplus)
##Heatmap
cazymes <- read.table('cazy_abund.txt', header=TRUE, row.names=1 ,sep ="\t")
#2. Define color palette and row side colors palette for the 3 categories.
my_pallet <- colorRampPalette(c('black', 'red'))(n = 299)
var1 <- c(rep("gold", 14),rep("green4", 38),rep("darkorange", 2), rep("dodgerblue", 2))
#4. Define data characteristics
col_breaks = c(seq(-0,1.09, length=100), seq(1.1,2.09,length=100), seq(2.1,8,length=100))
#5. Draw heatmap
png("CAZy_heatmap.png", width=1850, height=1850, res = 400)
heatmap.2(as.matrix(cazymes), col = my_pallet, RowSideColors = var1,  main = "CAZymes", density.info = 'none', trace = 'none', dendrogram = 'col', Rowv = "NA", cexCol = 0.62, cexRow = 0.49, margins = c(5,5), tracecol = "both", breaks = col_breaks, offsetRow=-0.3, offsetCol=-0.3, key.title=TRUE, key.xlab="CAZy abundance")
##Add legend to rowSide
legend("bottomleft", xpd = TRUE, legend = c("Starch","PCW","Sucrose", "Fructan"), col= c("gold", "green4","darkorange","dodgerblue"), lty = 1,lwd = 4, cex = 0.30)
dev.off()