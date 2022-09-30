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
library(viridis)

##Heatmap 
#1.Load table
cazymes <- read.table('cazy_abund.txt', header=TRUE, row.names=1 ,sep ="\t")


#3. Define color palette and row side colors palette for the 3 categories.
my_pallet <- colorRampPalette(c('blue','red'))(n = 299)
var1 <- c(rep("#fbb4ae", 9),rep("#b3cde3", 12),rep("#ccebc5", 2), rep("#decbe4", 1))

#4. Define data characteristics
col_breaks = c(0:2, seq(from = 40, to = max(cazymes) + 10, by = 10))

#5. Draw heatmap
png("Figure 3a.png",  units="cm", width=20.5, height=20.5, res=300)
heatmap.2(as.matrix(cazymes), 
	col = viridis::viridis_pal(), 
	RowSideColors = var1,  
	cex.main = 2.5,	
	main = "CAZymes", 
	density.info = 'none', 
	trace = 'none', 
	dendrogram = 'col', 
	Rowv = "NA", 
	cexCol = 1.4, 
	cexRow = 1.0, 
	margins = c(4,18), 
	tracecol = "both", 
	breaks =col_breaks,
	colsep=1:nrow(cazymes),
	rowsep=1:nrow(cazymes),
	sepcolor = "black", 
	sepwidth=c(0.0001, 0.0001),
	offsetRow=-0.2,
	offsetCol=-0.2, 
	key.title=TRUE, 
	key.xlab="CAZy abundance(%)",
	key.par = list(cex=1.0))
##Add legend to rowSide
legend("bottomright", xpd = TRUE,
	title="SUBSTRATE", 
	text.font =2 , 
	legend = c("Starch","PCW","Sucrose", "Fructan"),
	col= c("#fbb4ae", "#b3cde3","#ccebc5","#decbe4"), 
	lty = 1,lwd = 4, cex = 1.00)
dev.off()