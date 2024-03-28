library(readxl)
DiamBleach <- read_excel("D:/Ramon_Jellyfish/DiamBleach.xlsx")
View(DiamBleach)

cor.test(DiamBleach$PercentBleachedTissue, DiamBleach$Diameter, method = "spearman")

ggplot(DiamBleach, aes(Diameter, PercentBleachedTissue))+
  geom_point(size = 3)+
  xlab("Bell diameter (cm)")+
  ylab("Bleached tissue (%)")+
  theme_bw()
citation("stats")
