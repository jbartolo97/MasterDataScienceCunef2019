## Evita el overplotting del anterior ejercicio usando transparencia

#Libreria y datasets

library(ggplot2)

faithful


# Realizamos la gráfica usando transparencia

ggplot(faithful, aes(x = eruptions, y = waiting, alpha = 0.25)) + 
  geom_point()
