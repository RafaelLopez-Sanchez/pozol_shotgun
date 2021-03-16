CazyFamilies_perSubstrate_counts
#!/usr/bin/R4.0.3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 15 21:08:43 2021
@author: Diana Hernández-Oaxaca
#This script was created for cazy families per substrate plot of pozol fermentation metagenome
For more details contact to: https://github.com/DianaOaxaca
"""
setwd('/Users/Diana/OneDrive/POZOL_RAFA/2021/')
cazyps <- read.csv('cazyps.csv', header = TRUE, row.names = 1)
cazyps <- as.matrix(cazyps)
#Customize pallet colors with colorRampPallet
#Add breaks to pallet colors
#Create vector with color rowside
pdf("HeatmapCazy.pdf")
heatmap.2(cazyps, col = my_pallet, main = "CAZymes", density.info = 'none',
          trace = 'none', dendrogram = 'col', Rowv = "NA", cexCol = 0.62, cexRow = 0.35,
          margins = c(3,10), tracecol = "both", offsetRow=-0.4, breaks = col_breaks, RowSideColors = rowcol,
          offsetCol=-0.3, key.title=TRUE, key.xlab="Number of CAZy families") 
##Add legend to rowSide
dev.off()
