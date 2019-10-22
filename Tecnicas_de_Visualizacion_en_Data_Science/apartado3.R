##  Relaizar un scatterplot de waitings (eje Y) con eruptions (eje X)

#Libreria y datasets

library(ggplot2)

faithful


# Realizamos el scatterplot

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point()

