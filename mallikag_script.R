## Install Packages

library(dplyr)
library(readr)
library(ggplot2)
library(plotly)
library(tidyverse)
library(gapminder)
library(ggridges)

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
urbpop<- lapply(DRC$urbpop, as.numeric)
avgprec <- lapply(DRC$avgprec, as.numeric)
CO2emissionsgaseouskt <- lapply(DRC$CO2emissionsgaseouskt, as.numeric)

## Plotting Urban Population by Year Using Plot Function

DRC$Year <- as.numeric(as.character(DRC$Year))
DRC$urbpop <- as.numeric(as.character(DRC$urbpop))

DRC$avgprec <- as.numeric(as.character(DRC$avgprec))



plot(DRC$Year, DRC$urbpop, 
     pch=0.75, 
     col = "Red", 
     na.rm = FALSE, 
     main= "Urban Population from 1960 to 2020")

## Explanation

## In the above plot, I am showing the relationship between the Year and urban population. Based on 
## the graph, there is an exponential increase in the urban population as the years go on. The graph
## has an exponential growth. 

## Remove Duplicate Values
colnames(DRC) <- make.unique(names(DRC))


## 2D Histogram Showing Relationship between Year and Urban Population
ggplot(DRC, aes(x=Year, y=urbpop)) +
  geom_bin2d() +
  theme_bw() +
  labs(title="Urban Population Growth between Years of 1960 and 2020")

ggplot(DRC, aes(x=Year, y=urbpop) ) +
  geom_bin2d(bins = 70) +
  scale_fill_continuous(type = "viridis") +
  theme_bw() +
  labs(title="Urban Population Growth between Years of 1960 and 2020")

## Explanation

## I am visualizing the relationship between Year and Urban Population using a 2D histogram. This is 
## another way to visualize the data besides using the plot function. I labelled the x-axis to show 
## the year and y-axis urbpop.By looking at the visualization, I can see there is an exponential 
## growth between Year and Urban Population. This graph explains that as the years go by, the urban 
## population also increases.

## Ridgeline Plot
ggplot(DRC, aes(x = Year, y = agrland, fill = avgprec)) +
  geom_density_ridges(alpha=0.6, stat="binline", bins=20) +
  theme_ridges() + 
  theme(legend.position = "none") +
  labs(title="Agricultural Land and Year") +
  xlab("Year") +
  ylab("Agricultural Land")




