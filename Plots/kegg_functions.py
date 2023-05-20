#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat May 20 10:25:12 2023
@author: Diana Hernandez-Oaxaca
https://github.com/DianaOaxaca
#This script was created for kegg functions plot of pozol fermentation metagenome
"""
#Install modules
#pip3 install plotnine
#pip3 install pandas
#pip3 install numpy

import pandas as pd
import numpy as np
from plotnine import *
%matplotlib inline
kegg2=pd.read_csv("~/pozol_shotgun/Plots/KEGG_pozol_grouped.csv")                                                                                   
kegg_plot=(ggplot(kegg2, aes(x='Function', y='gene_abundance', fill='Fermentation_time')) 
 + geom_col(stat='identity', position='dodge') + coord_flip() + theme_classic()
 +labs(y='Number of genes', x='Categories', title='KEGG functional annotation')
ggsave(kegg_plot, "Figures/Figure3.pdf")
