#/usr/local/bin/R
CAZy_abund heatmap plot
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 15 21:08:43 2021
@author: Rafael López-Sánchez
#This script was created for cazy families per substrate plot of pozol fermentation metagenome

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

# Convert cm to inches
width_in <- 20.5 * 0.393701
height_in <- 20.5 * 0.393701

# Create the PDF file
pdf("Figure 4a.pdf", width=width_in, height=height_in, pointsize = 4)

#5. Draw heatmap
heatmap.2(as.matrix(cazymes), 
	col = viridis::viridis_pal(), 
	RowSideColors = var1,  
	cex.main = 4.5,	
	main = "CAZymes", 
	density.info = 'none', 
	trace = 'none', 
	dendrogram = 'col', 
	Rowv = "NA", 
	cexCol = 2.4, 
	cexRow = 2.4, 
	margins = c(8,18), 
	tracecol = "both", 
	breaks =col_breaks,
	colsep=1:nrow(cazymes),
	rowsep=1:nrow(cazymes),
	sepcolor = "black", 
	sepwidth=c(0.0001, 0.0001),
	offsetRow=-0.2,
	offsetCol=-0.2, 
 	key.xlab="CAZy abundance(%)",
	key.par = list(cex=2.0))

##Add legend to rowSide
legend("bottomleft", xpd = TRUE,
	title="SUBSTRATE", 
	text.font =2 , 
	legend = c("Starch","PCW","Sucrose", "Fructan"),
	col= c("#fbb4ae", "#b3cde3","#ccebc5","#decbe4"), 
	lty = 1,lwd = 4, cex = 2.00)
dev.off()
