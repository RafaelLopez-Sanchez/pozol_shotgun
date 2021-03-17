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
my_pallet <- colorRampPalette(c("black", "red", "darkorchid", "blue"))(n = 299)
#Add breaks to pallet colors
col_breaks = c(seq(-0,2.09, length=100), seq(2.1,23,length=100), seq(24,150,length=100))
#Create vector with color rowside
rowcol <- c("gold","gold", "gold", "gold","gold","gold","gold","gold","gold","gold","gold","gold","gold", "gold",
            "green4", "green4", "green4","green4","green4","green4","green4","green4","green4","green4",
            "green4","green4","green4","green4","green4","green4","green4","green4","green4","green4",
            "green4","green4","green4","green4","green4","green4","green4","green4","green4","green4",
            "green4","green4","green4","green4","green4","green4","green4",
            "darkorange", "darkorange","dodgerblue", "dodgerblue")
##Draw heatmap
pdf("HeatmapCazy.pdf")
heatmap.2(cazyps, col = my_pallet, main = "CAZymes", density.info = 'none',
          trace = 'none', dendrogram = 'col', Rowv = "NA", cexCol = 0.62, cexRow = 0.35,
          margins = c(3,10), tracecol = "both", offsetRow=-0.4, breaks = col_breaks, RowSideColors = rowcol,
          offsetCol=-0.3, key.title=TRUE, key.xlab="Number of CAZy families") 
##Add legend to rowSide
legend("topleft", xpd = TRUE, legend = c("Starch","PCW","Sucrose","Fructan"), col= c("gold", "green4","dodgerblue", "darkorange"), 
       lty = 1,lwd = 10, cex = 0.7)
dev.off()
