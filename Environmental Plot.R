

## Asymmetrical bleaching of upside-down jellyfish Cassiopea during high water temperatures in Cuba

## Ramón D. Morejón-Arrojo1*, Colin J. Anthony2, Leandro Rodríguez-Viera3

## 1Institute of Marine Science, Loma street, No. 14 between 35 and 37, Plaza de la Revolución, CP. 10400, Havana, Cuba. 
## 2Marine Laboratory, University of Guam, Mangilao, GU 96923, USA. 
## 3Faculty of Marine and Environmental Sciences, Campus de Excelencia Internacional del Mar (CEIMAR), University of Cadiz, Puerto Real, Cadiz, Spain. 

##  *Corresponding author: rmorejon99bio@gmail.com 








## Loading libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(tidyverse)
library(patchwork)

## Set work directory for environmental variables
setwd("D:/!TRABAJO/!!!Artículos/1-Working on/Bleaching in Cassiopea/Environmental")
p<- read.csv("All Data.csv", header=T, as.is=T, sep=";", stringsAsFactors = TRUE)

## Set work directory for annual mean of the temperature in the last five years
setwd("D:/!TRABAJO/!!!Artículos/1-Working on/Bleaching in Cassiopea/Environmental")
t<- read_excel("Datos 5 años.xlsx")
t<- as.data.frame(t)

## Object asignation
Prec<-p$`(mm) Precipitation`
SST<- p$`(deg C) SST (Sea Surface Temperature)`
temp<- p$`(deg C) Mean Temperature`

t$Year<- as.factor(t$Year)

## Plotting annual temperature for sample site
p4<- ggplot(t) +
  aes(x = Month, y = `Mean Temp`, colour = Year) +
  geom_point(shape = "circle", size = 1.6) +
  geom_line(linewidth= 0.6) +
  scale_color_hue(direction = 1) + 
  scale_x_continuous(breaks = seq(1, 12, by = 1))+
  theme_bw() +
  ylab(label = "Temperature (deg C)") +
  xlab(label = "Month")+
  theme(axis.title = element_text(size = 8))




## Precipitation Plot
p1<- p %>%
  filter(!(Date %in% "")) %>%
    
 ggplot() +  aes(x = Date, y = X.mm..Precipitation) + 
  geom_jitter(size = 1.6, color= "#F38D30") +
  theme_bw()+
  xlab(label = "Month")+
  ylab(label = "Precipitation (mm)") +
   theme(axis.title = element_text(size = 8))
                  

  
## Sea Surface Temperature Plot
p2<- p %>%
  filter(!(Date %in% "")) %>%
  ggplot() +
  aes(x = Date, y = X.deg.C..SST..Sea.Surface.Temperature.) +
  geom_jitter(size = 1.6, color= "#308344" ) +
  theme_bw() +
  xlab(label = "Month") +
  ylab(label = "Sea Surface Temperature (deg. C)")+
  theme(axis.title = element_text(size = 8))

## Mean Temperature Plot
p3<-p %>%
  filter(!(Date %in% "")) %>%
  ggplot() +
  aes(x = Date, y = X.deg.C..Mean.Temperature) +
  geom_jitter(size = 1.6, color= "#AD9024") +
  theme_bw()+
  xlab(label = "Month") +
  ylab(label = "Mean Temperature (deg. C)")+
  theme(axis.title = element_text(size = 8))

## Merge the plots 
p1 + p2 + p3 + p4+ plot_annotation(tag_levels = "A")+ plot_layout(ncol= 2)
