#PRACTICA 1.R

# Individual work with  DATA FRAME
#COMENZAMOS CREANDO LAS VARIABLES INCIALES
#1. Creating a new data frame
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25) 
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
misDatos <- data.frame(edad,tiempo,sexo)
misDatos #Data frame de las variables "edad", "tiempo" y "sexo" con sus diez objetos
rm(list=c("edad","tiempo","sexo")) #Eliminar las variables edad, sexo y tiempo del workspace.
str(misDatos)    # Estructura de 'misDatos' asignando el valor númerico 1 y 2 para H y M respectivamente
names(misDatos)  # Nombre de las variables contenidas en 'misDatos'

#2. Checking variables and data within the data frame
misDatos[3:6,] #Data frame de las variables "edad", "tiempo" y "sexo" de los obejtos 3 a 6.
misDatos[,1]
misDatos$edad
misDatos[,"edad"]
#Las expresiones de las filas 16, 17 y 18 conseguimos el mismo resultado es decir los objetos de la variable edad. Deducimos que la manera mas rápida es la segunda.

#3. Some operations 
mean(misDatos[,1])
mean(misDatos$edad)
mean(misDatos[,"edad"])
mean(misDatos[["edad"]])
#Diferentes formas de calcular la media de los 10 objetos de la variable edad.

#4. Functions ATTACH and DETACH
attach(misDatos) #Nos facilita la escritura de codigo a donde le indicamos en el attach
table(tiempo) #Tabla de tiempo ordenada de menor a mayor contabilizando que cantidad de tiempo iguales existen.
table(sexo) #Tabla de sexo contaibilizando que cantidad de H y M.
table(edad) #Tabla de edades ordenada de mayor a menor contabilizando que cantidad de edad iguales existen.
table(sexo,edad) #Tabla enfrentada de las variables sexo y edad
mean(edad[sexo=="M"]) #Media de las edades de las mujeres
mean(edad[sexo=="H"]) #Media de las edades de los hombres
detach(misDatos) #Deshacemos el attach

#5. New dataframe 'currencies' store some currencies
currencies = data.frame(amount=c(1,2),currency=c("Dolar", "Euro"), exchange=c(1, 0.9))
currencies
Countries<-data.frame(names=c("UK","Spain","Russia"),currency=c("Pound", "Euro", "Rublo"), exchange=c(1.2, 1, 0.02))
attach(currencies) # attach del data frame ´currencies´
currency          
attach(Countries)  #  'detach' to  'currencies' in common fields
currency          # from Countries
exchange           
amount   # from currencies

detach(Countries)  # detach el data frame Countries
currency          # from currencies
detach(currencies) # etach el data frame currencies
#currency          # error

#6. In short
longitud<-c(12,10,11,13,14,17) #agregamos variable longitud al workspace
medidas<-data.frame(longitud=c(6,4,7), peso=c(240,326,315), diametro=c(8,9,9)) #agregamos data frame ´medidas´al workspace
mean(longitud) #media de la variable longitud del workspace
mean(medidas$longitud) #media de la variable longitud incluida en el data frame ´medidas´
mean(medidas$peso) #media de la variable peso incluida en el data frame ´medidas´
mean(medidas$diametro) #media de la variable diametro incluida en el data frame ´medidas´

attach(medidas) #attach el data frame ´medidas´
mean(peso) #media de peso en el data frame ´medidas´
mean(diametro) #media de diametro en el data frame ´medidas´
mean(longitud) #media de longitud en el data frame ´medidas´
detach(medidas) #detach el data frame ´medidas´

# 7. Function WITH
with(medidas,{
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               # density
  dens       # local variable                     # 
}) #Con with podemos hacer varias operaciones a la vez y en este caso obtenemos las densidades de cada objeto de el data frame ´medidas´

medidas #table de ´medidas´incluyendo densidad

medidas$dens=with(medidas,{
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               #  density
  dens                          # 
}) #Con with podemos hacer varias operaciones a la vez y en este caso obtenemos las densidades de cada objeto de el data frame ´medidas´. Esta vez de una manera diferente a la anterior
medidas #table de ´medidas´incluyendo densidad

#8. SUBSET (FILTRADO)
hombres<-subset(misDatos,sexo=="H") #Agregamos a data frame ´hombres´ con los objetos de ´misDatos´ que corresponden a H
hombres #tabla de hombres
mujeres<-subset(misDatos,sexo=="M")  #Agregamos a data frame ´mujeres´ con los objetos de ´misDatos´ que corresponden a M
mujeres #tabla de mujeres

mayores<-subset(misDatos,sexo=="H" & edad>30) #Agregamos a data frame el grupo de hombres mayores de 30 años
mayores #tabla mayores de H mayores de 30

jov_habladores=subset(misDatos,sexo=="H" & edad<30 & tiempo>12) #Agregamos a data frame jov_habladores´ (hombres menores de 30 con tiempo menos que 12)
jov_habladores #tabla de jov_habladores

extremos=subset(misDatos,edad<25|edad>30) #Agregamos a data frame ´extremos´ (personas con edades de menos de 25 y mayores de 30)
extremos

hombres=subset(misDatos,sexo=="H", select=c(edad, tiempo)) #Hombres en el data frame tiene solo las variables edad y tiempo
hombres #tabla de hombres por edad y tiempo


# 9. MERGE - RBIND

animales1 <- data.frame(animal=c("vaca","perro","rana","lagarto","mosca","jilguero"), 
                       clase=c("mamÃ­fero","mamÃ­fero","anfibio","reptil","insecto","ave")) #Data frame de ´animales1´con 6 objetos y dos variables
animales1
animales2 <- data.frame(animal=c("atÃºn", "cocodrilo", "gato","rana"), clase=c("pez", "reptil", "mamÃ­fero","anfibio")) #Data frame de ´animales2´con 4 objetos y dos variables
animales2
animales3 <- rbind(animales1,animales2) #Conmbinacion de animales 1 y 2
animales3
animales4<-merge(animales1,animales2) #Comparacion de igualdades entre animales 1 y 2
animales4
animales5<-merge(animales1,animales2,all=TRUE) #Elimina animales repetidos
animales5
superficieAnimales=data.frame(animal=c("perro","tortuga","jilguero", 
                                       "cocodrilo","vaca","lagarto","sardina"),
                              superficie=c("pelo","placas Ã³seas","plumas",
                                           "escamas","pelo","escamas","escamas")) #Data frame de superficies de animales
superficieAnimales
merge(animales3,superficieAnimales) # Muestra sÃ³lo los animales comunes a ambos dataframes
merge(animales3,superficieAnimales, all.x=TRUE) # Muestra todos los animales del primer dataframe.
merge(animales3,superficieAnimales, all.y=TRUE) # Muestra todos los animales del segundo dataframe.
merge(animales3,superficieAnimales, all=TRUE) # Muestra todos los animales de ambos dataframes.

# 10. sorting DATAFRAMES
ordenacion=order(animales1$animal)
ordenacion  # Posiciones dentro del dataframe 'animales1' de los animales ordenados alfabÃ©ticamente
animales1=animales1[ordenacion,]  # Se reordenan las filas del dataframe animales1
animales1
animales1=animales1[order(animales1$animal),]  
misDatos=misDatos[order(misDatos$edad,misDatos$tiempo),] #ordena las edades de misDatos de menor a mayor 
misDatos
