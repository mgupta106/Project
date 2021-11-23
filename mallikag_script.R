## Install Packages

library(dplyr)
library(readr)
library(ggplot2)
library(plotly)
library(tidyverse)

climate_change_cod <- read_csv("climate_change_cod.csv")

View(climate_change_cod)


## Renaming Variables

cod_dataset <- rename(climate_change_cod, Indicator.Code = "Indicator Code", Country.Name = "Country Name", Country.Iso3 = "Country ISO3",Indicator.Name = "Indicator Name")
cod_dataset <- cod_dataset %>%
  select(-Country.Name, -Country.Iso3)

forest_area_km <- subset(cod_dataset,Indicator.Code == "AG.LND.FRST.K2")

CO2_emissions_gaseous_fuel_consumption_kt  <- subset(cod_dataset, Indicator.Code == "EN.ATM.CO2E.GF.KT")

population_growth_annual_percentage <- subset(cod_dataset,Indicator.Code == "SP.POP.GROW")

population_total <- subset(cod_dataset,Indicator.Code == "SP.POP.TOTL")

average_precipitation_depth_mm_peryear <- subset(cod_dataset, Indicator.Code == "AG.LND.PRCP.MM")

total_greenhouse_gas_emissions_kt_CO2 <- subset(cod_dataset, Indicator.Code == "EN.ATM.GHGT.KT.CE")

agricultural_land_km <- subset(cod_dataset, Indicator.Code == "AG.LND.AGRI.K2")

urban_population <- subset(cod_dataset, Indicator.Code == "SP.URB.TOTL")

## Slicing Variables

CO2emissionsgaseouskt <- slice(cod_dataset, 459:515)
CO2emissionsgaseouskt <- rename(CO2emissionsgaseouskt, CO2emissionsgaseouskt = "Value")

populationgrowth <- slice(cod_dataset, 1582:1641)
populationgrowth <- rename(populationgrowth, populationgrowth = "Value")
DRC<-merge(CO2emissionsgaseouskt, populationgrowth, by = "Year", all = TRUE)

avgprec <- slice(cod_dataset, 249:260)
avgprec <- rename(avgprec, avgprec= "Value")
DRC <- merge(DRC, avgprec, by = "Year", all = TRUE)

totalgreenhousekt <- slice(cod_dataset, 1105:1153)
totalgreenhousekt <- rename(totalgreenhousekt, totalgreenhousekt = "Value")
DRC <- merge(DRC, totalgreenhousekt, by = "Year", all = TRUE)

agrland <- slice(cod_dataset, 2:59)
agrland <- rename(agrland, agrland = "Value")
DRC <- merge(DRC, agrland, by = "Year", all = TRUE)

urbpop <- slice(cod_dataset, 1763:1823)
urbpop <- rename(urbpop, urbpop = "Value")
DRC <- merge(DRC, urbpop, by = "Year", all = TRUE)

## Two Visualizations

DRC <- as.data.frame(DRC)

agrland<- lapply(DRC$agrland, as.numeric)

## Plotting Urban Population by Year Using Plot Function

DRC$Year <- as.numeric(as.character(DRC$Year))
DRC$urbpop <- as.numeric(as.character(DRC$urbpop))

plot(DRC$Year, DRC$urbpop, pch=0.75, col = "Red", na.rm = FALSE, main= "Urban Population from 1960 to 2020")














 





