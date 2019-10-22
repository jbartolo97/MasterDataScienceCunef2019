#PRACTICA NUMERO 3.2

library(readr)
library(tidyverse)
library(rmarkdown)

# Base de datos sin NA en clasificacion

calificaciones_ECO_2019 <- read_delim("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Programación en R/CARPETAS R/calificaciones ECO 2019.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), na = "0",trim_ws = TRUE)
View(calificaciones_ECO_2019)

str(calificaciones_ECO_2019)

# a.1) Alumnos totales

total_alumnos<-nrow(calificaciones_ECO_2019)
cat("Son",total_alumnos, "el total de alumnos.")

# a.2) Nota media sin NA

presentados_EF<-subset(calificaciones_ECO_2019, calificaciones_ECO_2019$`Ex. JUNIO-12P`!="NA")
View(presentados_EF)

media_EFJ<-mean(presentados_EF$`Ex. JUNIO-12P`)
cat("La nota media del examen de junio es",round(media_EFJ,2))







