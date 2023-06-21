library(tidyr)
library(readr)
library(pheatmap)
library(RColorBrewer)


##################### Heatmap CGCs #################
setwd("~/Desktop")

#Load MAG annotation.
MAG=read.table('MAG.cazyme.txt', header=TRUE, row.names=1, sep="\t")
as.data.frame(MAG) -> MAG


#Remove zero labels from figure
MAG-> non_zero
non_zero[non_zero == 0] <- ""
as.data.frame(non_zero) -> non_zero#Color palette for the heatmapmy_palette <- colorRampPalette(c("white", "pink", "red"))(n = 40)

#Transpose the data frames.MAG=t(MAG)
non_zero=t(non_zero)

png("Figure 4.png", width=3000, height=1500, res = 600)
pheatmap(MAG, cluster_cols = FALSE, display_numbers = non_zero,  cluster_rows = FALSE, color= my_palette, main = "CGCs in MAGs found in pozol", cex.lab=0.6)

dev.off()


##########################################################################

##########################################################################

##################### Heatmap KEGG PATHWAYS #################

setwd("~/Desktop")
library(pheatmap)

#Load MAG annotation.
MAG <- read.table('kegg_aa_MAGs.txt', header=TRUE, row.names=1, sep="\t")
as.data.frame(MAG) -> MAG

# Color palette for the heatmap
my_palette <- colorRampPalette(c("white", "green", "forestgreen"))(n = 40)

# Transpose the data frames.
MAG <- t(MAG)

pdf("FigureS2.pdf", width = 10.75, height = 5.63, pointsize = 12)
pheatmap(MAG, cluster_cols = FALSE, cluster_rows = FALSE, color = my_palette, main = "Completeness of biosynthesis pathways of amino acids and vitamins in MAGs found in pozol", cex.lab = 0.7)
dev.off()


