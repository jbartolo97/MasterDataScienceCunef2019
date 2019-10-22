# 1. Crear un nuevo proyecto denominado practica 4.

# 2. Mediante la libreria readr, o mediante los menus de RStudio, leer los datasets sleep.csv  y activities.csv
# ambos archivos deben estar previamente en la carpeta del proyecto creado
library(readr)
library(tidyverse)
library(dplyr)
activities <- read_csv("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Programación en R/CARPETAS R/PRACTICAS/PRACTICA 4/PRACTICA 4/activities.csv")
sleep <- read_csv("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Programación en R/CARPETAS R/PRACTICAS/PRACTICA 4/PRACTICA 4/sleep.csv")

# 3.Comprobar el contenido  con View y contar cuantos NAs hay en la columna GPS del dataset activities
View(sleep)
View(activities)
sum(is.na(activities$GPS))

# 4. Crear un objeto R denominado act_new que contenga solo las variables 
# siguientes: 1,2,5,6
act_new<- select(activities,1,2,5,6)
view(act_new)

# 5. Renombrar la variable 'Activity type' con el nombre 'tipo' y la variable 'Time zone' como 'ciudad'
activities<- rename(activities,'tipo'= 'Activity type', 'ciudad'= 'Timezone') #Renombramos en ambos data
act_new<- rename(act_new,'tipo'= 'Activity type', 'ciudad'= 'Timezone')
# 6. Realizar un recuento de tipo de actividad con summary. Para ello 
# debes transformar previamente la variable tipo a factor con as.factor.
# Crea un grafico de barras con dicha variable para visualizar las frecuencias.
# Haz lo mismo para la variable ciudad
activities$tipo<- as.factor(activities$tipo)
summary(activities$tipo)
plot(x=activities$tipo)

activities$ciudad<-as.factor(activities$ciudad)
summary(activities$ciudad)
plot(x=activities$ciudad)

#7. Filtrar los registros de act_new que correspondan con ciudad Amsterdam en otro objeto
# y lo mismo con Madrid. Con esos nuevos objetos determina los deportes que 
# no se practican en Amsterdam y si en Madrid y viceversa. Genera graficos para visualizar los resultados
#OBEJTOS AMSTERDAM Y MADRID SOLO
amsterdam<-filter(act_new, ciudad=="Europe/Amsterdam")
madrid<-filter(act_new, ciudad=="Europe/Madrid") 
setdiff(amsterdam$tipo, madrid$tipo)
setdiff(madrid$tipo, amsterdam$tipo)

#8. Encontrar las fechas en las que se ha practicado bicicleta o pilates en Amsterdam en el a?o 2019
#FILTER CON COMPOSICION DE COSAS (SI NO SALE, QUITAMOS A?O 2019, XQ HAY QUE TRANSFORMAR A 2019)
fechas_bici_pilates<-filter(amsterdam, tipo=="Cycling"  | tipo=="Pilates")
fechas_bici_pilates
#9. Crear una nueva variable dif con los minutos de realizaci?n de cada actividad en Amsterdam
# y realizar una representaci?n gr?fica de los resultados con plot y determinar que deporte o deportes
# se han practicado durante dos horas o mas
#MUTATE!!!!
dif<-mutate(amsterdam, tiempo=a-de)

dif%>%
  
  group_by(tipo) %>%
  
  summarize(sum(tiempo))

#10. Guardar el nuevo dataset en un archivo llamado  "act_new.csv"
#WRITE.CSV EN UN NUEVO ARCHIVO EN NUESTRO PROYECTO

#-------------------------------
#-----SEGUNDA PARTE-------------
# 11. Cargar el dataset sleep en un objeto llamado sleep
sleep <- read_csv("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Programación en R/CARPETAS R/PRACTICAS/PRACTICA 4/PRACTICA 4/sleep.csv")

#12. crear un nuevo data set llamado sleep_new que contenga solo las variables
#que contengan informaci?n, que no sean todo cero.
summary(sleep)
sleep_new <- data.frame(select(sleep, -"Rem (seg)", -"Snoring episodes", -"Average heart rate", -"Heart rate (min)", -"Heart rate (max)"))

#13. Renombrar las variables de sleep_new a nombres cortos:
sleep_new<-rename(sleep_new,"ligero"="ligero..s.",'profundo'='profundo..s.','despierto'='despierto..s.', 'tiempo_de_dormir'='Duration.to.sleep..s.', 'tiempo_de_despertar'='Duration.to.wake.up..s.', 'roncar'='Snoring..s.' )

#14. Eliminar todas las filas que contengan alg?n NA
sleep_new <- na.omit(sleep_new)

# 15. Calcular cuanto tiempo en total se ha dormido cada noche: ligero+profundo
#SUMAR EN SEGUNDOS Y PARA REPRESENTACION PASARLO A HORAS
ligero_y_profundo <- mutate (sleep_new, total=ligero + profundo)
ligero_y_profundo

# 16. Visualizacion de la relacion ligero-profundo-total
#GGPLOT2, 3 GRAFICOS, CON LIGEROTOTAL, LIGEROPROFUNDO, PROFUNDO TOTAL

#PRIMERA FORMA
plot(sleep_new$ligero, sleep_new$profundo)
plot(sleep_new$ligero, sleep_new$ligero_y_profundo)
plot(sleep_new$profundo, sleep_new$ligero_y_profundo)

#SEGUNDA FORMA
ggplot(data = sleep_new) + 
  geom_point(mapping = aes(x=sleep_new$ligero, y=sleep_new$profundo))
ggplot(data = sleep_new) + 
  geom_point(mapping = aes(x=sleep_new$ligero_y_profundo, y=sleep_new$ligero))
ggplot(data = sleep_new) + 
  geom_point(mapping = aes(x=sleep_new$profundo, y=sleep_new$ligero_y_profundo))

# A la vista de los resultados, que tipo de sue?o es mas relevante?
#Respuesta: el plot mas relevante es el primero, el que corresponde a LIGEROPROFUNDO

# 17. Realizar un analisis de diferencias entre los dos tipos de sue?o e interpretar los resultados
# usar la funci?n ICalpha o el 'One sample t-test' de TeachingDemos: t.test()
t.test(x=((sleep_new$profundo)-(sleep_new$ligero)), mu=0)

#18. Crear una nueva variable 'ciudad' en sleep_new con la informacion de act_new.
#CREAMOS LA VARIABLE CIUDAD (RELLENARLA CON UN FOR)
#NO SE HACERLO VICTORIA, SI LO PUEDIESEMOS VER EN CLASE SERIA PERFECTO

#19. Representar la relaci?n totalsleep y profundo usando como facetas el factor ciudad
#NO SE HACERLO VICTORIA, SI LO PUEDIESEMOS VER EN CLASE SERIA PERFECTO

#20. Guardar el dataset sleep_new en un archivo "sleep_new.csv"
write.csv(sleep_new, file="sleep_new.csv")
#21. Guardar el proyecto completo. Subir la carpeta del proyecto al campus.
#GUARDADO Y COMPLETADO
