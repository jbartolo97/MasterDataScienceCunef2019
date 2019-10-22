## Creación de un gráfica con todas las variables con líneas de distintos colores a lo largo del tiempo (tiempo = eje X)
  

#Libreria y datasets

library(ggplot2)

economics
economics_long

# Elegimos el dataset economics long ya que nos muestra una variable que contiene
# todas las variables del dataset economics. Se elige la variable value01.

ggplot(economics_long, aes(x = date)) + 
  geom_line( aes( y = value01, color = variable))

