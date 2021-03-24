#/usr/local/bin/R
metacyc pathways
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 24 2021
@author: Rafael López-Sánchez
#This script was created for CAZy families per substrate plot on bins of pozol fermentation metagenome
"""
# Loading the required libraries
library(pracma)
library(vegan)
library(gplots)
library(RColorBrewer)
library(Heatplus)
##Heatmap
#1. Read matrix
path <- read.table('heatmap_pathways.txt', header=TRUE, row.names=1 ,sep ="\t")
#2.Transpose matrix
path<-t(path)
#3. Define color palette and row side colors palette for the 3 categories.
my_pallet <- colorRampPalette(c('red', 'green'))(n = 299)
#4. Draw heatmap
png("pathway_heatmap.png", width=1850, height=1850, res = 300)
heatmap.2(as.matrix(path), col = my_pallet,   main = "Metabolic pathways", density.info = 'none', trace = 'none', dendrogram = 'col', Rowv = "NA", cexCol = 0.6, cexRow = 0.6, margins = c(10,12.4), tracecol = "both", colsep=1:nrow(path),rowsep=1:nrow(path),sepcolor = "white", sepwidth=c(0.01, 0.01),offsetRow=-0.3, offsetCol=-0.3, key.title=TRUE, key.xlab="Completeness")
dev.off()