
View(climate_change_cod)
library(dplyr)
library(base)
library(tidyverse)
library(gt)
library(scales)

cod_dataset <- read.csv("climate-change_cod.csv")

#change rows in to datasets w two columns.
#one is year
#one is data

#All rows with AG.LND.AGRI.ZS = dataset named "agri_land_by_km"
#Column w/ year
#column w/ percent


##DO NOT RUN THIS CODE###
##THIS WAS INITIAL CODE TO SET UP THE DATASET##
#cod_dataset <- rename(cod_dataset, code = "Indicator Code", country_name = "Country Name", country_iso3 = "Country ISO3", i_name = "Indicator")
cod_dataset <- select(cod_dataset, Year, Value, Indicator.Code)
#cod_dataset <- cod_dataset[-c(1), ]



  

agkm  <- slice(cod_dataset, 2:59)
agkm <- rename(agkm, ag.lnd.sq.km = "Value")
agp  <- slice(cod_dataset, 60:175)
agp <- rename(agp, ag.lnd.per = "Value")
DRC <- merge(agkm, agp, by = "Year", all = TRUE)


forestkm <-slice(cod_dataset, 191:219)
forestkm <- rename(forestkm, fkm = "Value")
DRC <- merge(DRC, forestkm, by= "Year", all = TRUE)



ate <- slice(cod_dataset, 369:388)
ate <- rename(ate, ate = "Value")
DRC <- merge(DRC, ate, by = "Year", all = "TRUE")




rec <-slice(cod_dataset, 389:414)
rec <-rename(rec, rec = "Value")
DRC <- merge(DRC, rec, by = "Year", all = TRUE)


upa <- slice(cod_dataset, 1344:1404)
upa <- rename(upa, upa = "Value")
DRC<- merge(DRC, upa, by = "Year", all = TRUE)


tpop <- slice(cod_dataset, 1642:1702)
tpop <- rename(tpop, tpop = "Value")
DRC <- merge(DRC, tpop, by = "Year", all = TRUE)



popg <- slice(cod_dataset, 1582:1641)
popg <- rename(popg, popg = "Value")
DRC <- merge(DRC, popg, by = "Year", all = TRUE)

#remove unnecessary dataframes
remove(popg, upa, tpop, rec, ate, forestkm, agkm, agp)


#Plotting total pop. growth

#remove unnecessary dataframes
remove(popg, upa, tpop, rec, ate, forestkm, agkm, agp)

popg<- lapply(DRC$popg, as.numeric)


DRC <- as.data.frame(DRC)
#Plotting total pop. growth

DRC$Year <- as.numeric(as.character(DRC$Year))
DRC$popg <- as.numeric(as.character(DRC$popg))
DRC$


plot(DRC$Year, DRC$popg, pch = 0.5, na.rm = FALSE, main = "Population Growth 1960 to 2020")



colnames(DRC) <- make.unique(names(DRC)) #if getting duplicate 'data' error
DRC <- as.data.frame(lapply(DRC, na.omit)) #trying to remove NA values


g <- ggplot(data = DRC)+
  geom_point(mapping = aes(Year, popg), na.rm = TRUE,)
g



