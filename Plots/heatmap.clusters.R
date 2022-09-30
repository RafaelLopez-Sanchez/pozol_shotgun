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
pheatmap(MAG, cluster_cols = FALSE, display_numbers = non_zero,  cluster_rows = FALSE, color= my_palette, main = "CGCs in MAGs", cex.lab=0.6)

dev.off()


##########################################################################

##################### Heatmap RGIs #################
setwd("~/Desktop")
#Load MAG annotation.
MAG=read.table('MAG.rgi.txt', header=TRUE, row.names=1, sep="\t")
as.data.frame(MAG) -> MAG

#Remove zero labels from figure
MAG-> non_zero
non_zero[non_zero == 0] <- ""
as.data.frame(non_zero) -> non_zero#Color palette for the heatmapmy_palette <- colorRampPalette(c("white", "green", "forestgreen"))(n = 40)

#Transpose the data frames.MAG=t(MAG)
non_zero=t(non_zero)

png("Figure 5b.png", width=3000, height=1500, res = 300)
pheatmap(MAG, cluster_cols = FALSE, display_numbers = non_zero, cluster_rows = FALSE, color= my_palette, main = "RGIs in MAGs", cex.lab=0.6)

dev.off()

##################### Heatmap BGCs #################
setwd("~/Desktop")

#Load MAG annotation.
MAG=read.table('MAG.bgc.txt', header=TRUE, row.names=1, sep="\t")
as.data.frame(MAG) -> MAG

#Remove zero labels from figure
MAG-> non_zero
non_zero[non_zero == 0] <- ""
as.data.frame(non_zero) -> non_zero#Color palette for the heatmapmy_palette <- colorRampPalette(c("white", "yellow", "orange"))(n = 40)

#Transpose the data frames.MAG=t(MAG)
non_zero=t(non_zero)

png("Figure 5a.png", width=3000, height=1500, res = 300)
pheatmap(MAG, cluster_cols = FALSE, display_numbers = non_zero, cluster_rows = FALSE, color= my_palette, main = "BGCs in MAGs", cex.lab=0.6)

dev.off()



