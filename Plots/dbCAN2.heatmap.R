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
var1 <- c(rep("#e41a1c", 14),rep("#377eb8", 15),rep("#4daf4a", 3),rep("#984ea3", 1))
#3. Define data characteristics
col_breaks = c(seq(-0,1.09, length=100), seq(1.1,2.09,length=100), seq(2.1,8,length=100))

# Convert cm to inches
width_in <- 20.5 * 0.393701
height_in <- 20.5 * 0.393701

# Create the PDF file
pdf("Figure 4b.pdf", width=width_in, height=height_in, pointsize = 4)

#4. Draw heatmap
heatmap.2(as.matrix(cazymes), 
	col = my_pallet, 
	RowSideColors = var1,  
	cex.main = 2.0,	
	main = "CAZymes in MAGs", 
	density.info = 'none', 
	trace = 'none', 
	dendrogram = 'col', 
	Rowv = "NA", 
	cexCol = 2.4, 
	cexRow = 2.0, 
	margins = c(33,18), 
	tracecol = "both", 
	breaks =col_breaks,
	colsep=1:nrow(cazymes),
	rowsep=1:nrow(cazymes),
	sepcolor = "white", 
	sepwidth=c(0.01, 0.01),
	offsetRow=-0.3,
	offsetCol=-0.3, 
	key.xlab="Number of CAZy families",
	key.par = list(cex=1.6))
##Add legend to rowSide
legend("bottomleft", xpd = TRUE,
	title="SUBSTRATE", 
	text.font =2 , 
	legend = c("Starch","PCW","Sucrose", "Fructan"),
	col= c("#fbb4ae", "#b3cde3","#ccebc5","#decbe4"), 
	lty = 1,lwd = 4, cex = 2.00)
dev.off()
