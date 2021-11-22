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
CO2emissionsgaseouskt <- rename(CO2emissionsgaseouskt, CO2 = "Value")

populationgrowth <- slice(cod_dataset, 1582:1641)
populationgrowth <- rename(populationgrowth, popgrow = "Value")
DRC<-merge(CO2emissionsgaseouskt, populationgrowth, by = "Year", all = TRUE)

avgprec <- slice(cod_dataset, 249:260)
avgprec <- rename(avgprec, avg.precipitation.mm = "Value")
DRC <- merge(DRC, avgprec, by = "Year", all = TRUE)

totalgreenhousekt <- slice(cod_dataset, 1105:1153)
totalgreenhousekt <- rename(totalgreenhousekt, total.emissions.C02.kt = "Value")
DRC <- merge(DRC, totalgreenhousekt, by = "Year", all = TRUE)

agrland <- slice(cod_dataset, 2:59)
agrland <- rename(agrland, agr_land = "Value")
DRC <- merge(DRC, agrland, by = "Year", all = TRUE)

urbpop <- slice(cod_dataset, 1763:1823)
urbpop <- rename(urbpop, urb.pop.total = "Value")
DRC <- merge(DRC, urbpop, by = "Year", all = TRUE)

## Two Visualizations

## Plotting agricultural land by Year

ggplot(agrland, aes(x=agr_land, y=Year)) +
  geom_point() +
  scale_x_discrete(limits=c(250500, 315000), breaks=c(250500, 275500, 300500, 325500)) +
  scale_y_discrete(limits=c(1961, 2020), breaks=c(1961, 1981, 2001, 2021)) +
  labs(title = "Agricultural Land")






 





