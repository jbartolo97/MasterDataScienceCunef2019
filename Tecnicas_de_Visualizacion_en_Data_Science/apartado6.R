## Solapa el jittering y la estimación de densidad


#Libreria y datasets

library(ggplot2)

faithful

# Realizamos la gráfica usando jittering y la estimación de la densidad

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(position = "jitter") + 
  geom_jitter() +
  geom_density2d()

