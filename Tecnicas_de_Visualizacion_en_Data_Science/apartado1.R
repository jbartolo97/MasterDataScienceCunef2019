## Creación de una gráfica con una línea temporal representando la variable "unemploy" (tiempo = eje X) ##

#Libreria y datasets

library(ggplot2)

economics

# Dos opciones mostradas

ggplot(economics, aes(x = date, y = unemploy)) + 
  geom_line()
ggplot(economics, aes( x = date, y = unemploy)) + 
  geom_col()
