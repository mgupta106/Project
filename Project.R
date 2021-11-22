#######
#Data Visualisation first
#######

library(dplyr)
library(base)
library(ggplot2)
ccc <- read.csv("climate-change_cod.csv")
cod_dataset <- ccc
cod_dataset <- select(cod_dataset, Year, Value)


##DO NOT RUN THIS CODE###
##THIS WAS INITIAL CODE TO SET UP THE DATASET##
#cod_dataset <- rename(cod_dataset, code = "Indicator Code", country_name = "Country Name", country_iso3 = "Country ISO3", i_name = "Indicator")
#cod_dataset <- select(-Country.Name, -Country.IS03)
#cod_dataset <- cod_dataset[-c(1), ]

#Slicing and dicing our chosen variables into a df called 'DRC'



                                                      