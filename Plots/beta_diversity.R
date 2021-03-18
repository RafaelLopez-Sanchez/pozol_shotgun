#/usr/local/bin/R
matrix_abund
#!/usr/bin/R.3.6.2
# -*- coding: utf-8 -*-
"""
Created on Mar 18 2021
@author: Rafael López-Sánchez
#This script was created for getting Beta Diversity PCOa with the Bray-Curtis dissimilitary index  at the genus level in pozol fermentation.
"""


# Loading the required libraries
library(pracma)
library(vegan)

# Assigning colors to the samples based on the time of fermentation.
colvec <- c("green", "red", "blue", "black")

# Reading the abundance table (samples must be organized by row while genus/species composition must be organized by column)
beta=read.table('beta_genus.txt', header=TRUE, row.names=1, sep="\t")

# Transpose the table
beta=t(beta)

# Calculating Bray-Curtis dissimilarity
Bray=vegdist(beta,"bray")

# Applying a non-constrained ordination (PCoA) on the dissimilarity matrix 
beta_bray=capscale(Bray~-1)

# Extracting the percentage explained by the first two dimensions and automatically adding them to the axes titles

beta_bray_eig = eigenvals(beta_bray)
percentage_variance_explained <- beta_bray_eig / sum(beta_bray_eig)
sum_percentage_variance_explained <- cumsum(beta_bray_eig / sum(beta_bray_eig))
xlabel= as.numeric(format(round((percentage_variance_explained[1]*100), 2), nsmall = 2))
xlabel= sprintf("%.2f %%", xlabel)
xlabel= paste ("PCo1 (", xlabel, ")")
ylabel= as.numeric(format(round((percentage_variance_explained[2]*100), 2), nsmall = 2))
ylabel= sprintf("%.2f %%", ylabel)
ylabel= paste ("PCo2 (", ylabel, ")")


# Applying hierarchical clustering on the dissimilarity matrix for plotting on top of the ordination analysis

H_CLustering=hclust(vegdist(beta,"bray"))

# Plotting the figure
# Adding the axes, grid, and other aestethics
plot(beta_bray, family="Arial", type="n", xlab="", ylab="",ylim=c(-1,1), xlim=c(-1, 1), cex.axis=0.6, tck = -0.01, mgp = c(3, 0.2, 0), 
     xaxp  = c(-4, 4, 8), panel.first=grid(col = "white",lty=0))
title(ylab=ylabel, line=1.2, cex.lab=0.7)
title(xlab=xlabel, line=1.2, cex.lab=0.7)
abline(h=0, v=0, col = "white", lty = 1, lwd = 1.5)
abline(h=-10:10, v=-10:10, col = "lightgray", lty = "dotted", lwd = 0.5)
par(lty=2)

# Adding the hierarchical clustering
ordicluster(beta_bray, H_CLustering,  display = "sites", col = "grey", lwd = 0.5)

# Adding the samples at the end to be on top of all the other plotted elementstext(beta_bray,cex= 1,pch=21, col=c("green", "red", "blue", "black"), bg= colvec, lwd = 0.5)