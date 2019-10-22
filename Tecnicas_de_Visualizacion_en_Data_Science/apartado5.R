## Evita el overplotting usando jittering

#Libreria y datasets

library(ggplot2)

faithful

# Realizamos la gráfica usando jittering

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(position = "jitter") + 
  geom_jitter() 
