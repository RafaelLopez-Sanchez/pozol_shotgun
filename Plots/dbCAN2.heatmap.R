#/usr/local/bin/R
dbCAN2_Family_counts
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
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
cazymes <- read.table('dbcan2_matrix.txt', header=TRUE, row.names=1 ,sep ="\t")

#2. Define color palette and row side colors palette for the 3 categories.
my_pallet <- colorRampPalette(c('black', 'green'))(n = 299)
var1 <- c(rep("#e41a1c", 14),rep("#377eb8", 14),rep("#4daf4a", 2),rep("#984ea3", 2))
#3. Define data characteristics
col_breaks = c(seq(-0,1.09, length=100), seq(1.1,2.09,length=100), seq(2.1,8,length=100))
#4. Draw heatmap
png("dbCAN2_heatmap.png", width=1600, height=1600, res = 300)
heatmap.2(as.matrix(cazymes), col = my_pallet, RowSideColors = var1,  main = "CAZymes", density.info = 'none', trace = 'none', dendrogram = 'col', Rowv = "NA", cexCol = 0.8, cexRow = 0.55, margins = c(5,5), tracecol = "both", breaks = col_breaks, colsep=1:nrow(cazymes),rowsep=1:nrow(cazymes),sepcolor = "white",offsetRow=-0.3, offsetCol=-0.3, key.title=TRUE, key.xlab="Number of CAZy families")
#5.Add legend to rowSide
legend("topleft", xpd = TRUE, legend = c("Starch","PCW","Sucrose", "Fructan"), col= c("#e41a1c", "#377eb8","#4daf4a", "#984ea3"), lty = 2,lwd = 4, cex = 0.37)
dev.off()