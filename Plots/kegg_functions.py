#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar 13 14:41:34 2021
@author: Diana Hernandez-Oaxaca
https://github.com/DianaOaxaca
#This script was created for kegg functions plot of pozol fermentation metagenome
"""
import pandas as pd
import numpy as np
from plotnine import *
%matplotlib inline
kegg2=pd.read_csv("/Users/Diana/OneDrive/POZOL_RAFA/2021/pozol_group_table.csv")                                                                                   
(ggplot(kegg2, aes(x='Function', y='gene_abundance', fill='Fermentation_time')) 
 + geom_col(stat='identity', position='dodge') + coord_flip() + theme_classic()
 +labs(y='Number of genes', x='Categories', title='KEGG functional annotation'))
