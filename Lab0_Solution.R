# Lab O -- Diego de Cabanyes 

#rm(list = ls()) # Clear Global Environment 
setwd("/Users/diegodecabanyes/Desktop/MBA/Data Analytics /Lab01")
EPI_data <- read.csv("2010EPI_data.csv") 

names(EPI_data) = EPI_data[1,] # make first row the headers
EPI_data = EPI_data[-1,] # remove the first row
EPI <- EPI_data$EPI
EPI <- as.numeric(EPI)
summary(EPI) # stats 
boxplot(EPI)
hist(EPI)

# ---------- END OF LAB_0 ----------------------

