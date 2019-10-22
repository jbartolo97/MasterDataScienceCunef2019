#PRACTICA DE LA CESTA

#Ponemos encima de la mesa las tres bibliotecas que vamos a utilizar
library(dplyr)
library(ggpubr)
library(PairedData)

#Importamos los datos ubicados en nuestra carpeta
LA_CESTA <- read_csv("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Fundamentos para el Análisis de Datos y la Investigación/LA CESTA.csv")

#Realizamos una poisson ya que lo unico que podemos encontrar la media

media<- mean(LA_CESTA$x)
media     #La media que obtenemos es lambda


#a)Calcular la probabilidad de que no entre ningun cliente en un minuto:
#Si no entra ningun cliente x es 0

dpois(x=0, lambda = 0.78) 

#b)Calcular la probabilidad de que accedan entre 2 y 5 clientes

dpois(x=2:5, lambda = 0.78)#Obtenemos cuatro probabilidades distintas
sum(dpois(x=2:5, lambda = 0.78))#Sumamos probabilidades totales

#c)Que en 5 minutos accedan mas de 10 clientes

nueva_media<- 0.78*5 #creamos una nueva media
1-ppois(10,3.9)

#Realizamos el intervalo de confianza al 95%

test<-t.test(LA_CESTA$x)
test
#Obtenemos valores medios  entre (0.708 ,  0.851)

Competidora<- rnorm(500,0.69,0.96)

contraste_empresa<-t.test(LA_CESTA$x,Competidora)
contraste_empresa

#Al estar incluido el 0 en el intervalo de confianza del 95% se rechaza la hipotesis nula 
