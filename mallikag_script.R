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

## Visualizations




 





