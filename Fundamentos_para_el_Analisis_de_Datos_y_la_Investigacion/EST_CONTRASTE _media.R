#################### FUNDAMENTOS DE ESTADISTICA ############################

########################### INFERENCIA  ###################################




#install.packages("ggpubr")

library(ggpubr)




datos1 <- read.csv("C:/Users/jbart/OneDrive/Escritorio/CUNEF/Fundamentos para el Análisis de Datos y la Investigación/CASOS R/index.csv")


datos1

summary(datos1$Index)



#Si n<30 ---- verificamos la normalidad


shapiro.test(datos1$Index) #la w significa....

# si p-valor >0.05 asumimos normalidad




#Visualizaci?n de la normalidad de los datos usando qqplots

#(cuantiles de la muestra y la normal)

  ggqqplot(datos1, x="Index",ylab = "Calificaciones", xlab = "Te?ricas",
         ggtheme = theme_minimal())


  
  

#Si los datos no se distribuyen normalmente se realizar? el

  #test de Wilcoxon. 



##################### Test

############Sobre la media de la poblaci?n
  

  # hO:MU=20


resultado1 <- t.test(datos1$Index, mu = 13)

# Obtenemos resultados

resultado1 

#Al obtener un p-valor < 0.05, el valor medio de la muestra es

#significativamente diferente a 20.



#Alternativa inferior

resultado2 <- t.test(datos1$Index, mu = 13,
       alternative = "less")

resultado2


#Alternativa mayor

resultado3 <- t.test(datos1$Index, mu = 13,
       alternative = "greater")

resultado3



# Devuelve el p-valor
resultado1$p.value

# Devuelve el valor medio
resultado2$estimate

# Intervalo de confianza
resultado3$conf.int

