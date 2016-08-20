library(dplyr)
library(VIM)
library(mice)
library(PASWR)
library(ggplot2)
library(MASS)

data = read.csv('/Users/dk1306/downloads/training.csv', header=T)

data[data==-999.0] = NA
data[data==-999.0] = NA

EventId = data$EventId
Weight  = data$Weight
Label   = data$Label

data = data[, -c(1,32,33)]          # Get rid of EventId Weight Label
PRI_jet_num = data$PRI_jet_num      # Jet number is a category variable so do not scale it
data = as.data.frame(scale(data))   # Scale data, it is scaling Jet number also 
data$PRI_jet_num = PRI_jet_num      # Use unscaled Jet number in the data

tf = colSums(is.na(data)) !=0       # Columns missing any data 

length(colnames(data)[tf])          # Number of columns missing any data
#[1] 11

colSums(is.na(data))[colnames(data)[colSums(is.na(data)) !=0] ]/nrow(data)*100     # Column Names and % of missing data 
#DER_mass_MMC   DER_deltaeta_jet_jet       DER_mass_jet_jet    DER_prodeta_jet_jet DER_lep_eta_centrality 
#15.2456                70.9828                70.9828                70.9828                70.9828 
#PRI_jet_leading_pt    PRI_jet_leading_eta    PRI_jet_leading_phi  PRI_jet_subleading_pt PRI_jet_subleading_eta 
#39.9652                39.9652                39.9652                70.9828                70.9828 
#PRI_jet_subleading_phi 
#70.9828

colnames(data)[which(colSums(is.na(data))[colnames(data)[colSums(is.na(data)) !=0] ]/nrow(data)*100 >70)] # Name of Columns missing more than 70 % data
#[1] "DER_mass_transverse_met_lep" "DER_mass_vis"                "DER_pt_h"                    "DER_deltaeta_jet_jet"       
#[5] "DER_pt_tot"                  "DER_sum_pt"                  "DER_pt_ratio_lep_tau" 

sum(is.na(data))/ (nrow(data)* ncol(data))*100    # % of cells missing data
#[1] 21.06736

sum(complete.cases(data)) / nrow(data)*100    # % of events/rows with complete data
#[1] 27.2456

aggr(data)                   # Display Missinggness
md.pattern(data)             # Missingness in numerical format 

#####################################################################################

Response = as.data.frame(cbind("Label" = as.factor(Label),Weight))       # EDA on predictions  
Response$Label = Label

#~~~~~~~~~~~~~

n.bin = 20                                         # Number of categories to split Weight
labels=c(1:n.bin)                                  # Labeling the new categories 
f = cut(Response$Weight,n.bin ,labels=labels)      # Categorical variable for scaled weights
tbl = table(Label,f)
tbl
#Label     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20
#b 23389 10550  5629 11176 23949 24594 12135  5834  1343   358  3278 11736 12959  6762  4235  2780  2023  1138   413    52
#s 85667     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0

chisq.test(tbl)                       # Weights and Label are dependent on each other 
#Pearson's Chi-squared test
#data:  tbl
#X-squared = 168430, df = 19, p-value < 2.2e-16

#~~~~~~~~~~~~~

max((Response$Weight[Response$Label == 's'])) < min(Response$Weight[Response$Label == 'b']) # Signal and background are mutually exclusive in weights
#[1] TRUE

#Signal events have low weights 


#~~~~~~~~~~~~~


g = ggplot(data = Response, aes(x =Weight))
g + geom_histogram(aes(fill = Label), binwidth = 0.1)
ggsave("/Users/dk1306/nycdsa-kaggle-project/Data_Processing/s_AND_b_weight_histogram.png")


g = ggplot(data = Response[Response$Weight <= max(Response$Weight[Response$Label == 's']),], aes(x =Weight))
g + geom_histogram(aes(fill = Label), binwidth = 0.0002)
ggsave("/Users/dk1306/nycdsa-kaggle-project/Data_Processing/s_weight_histogram.png")

g = ggplot(data = Response[Response$Weight > max(Response$Weight[Response$Label == 's']),], aes(x =Weight))
g + geom_histogram(aes(fill = Label), binwidth = 0.1)
ggsave("/Users/dk1306/nycdsa-kaggle-project/Data_Processing/b_weight_histogram.png")


#####################################################################################
