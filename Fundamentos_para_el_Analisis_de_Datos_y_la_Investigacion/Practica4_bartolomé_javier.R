### PRÁCTICA 4 ###

# Importamos librerias
library(queueing)

# Realizamos el caso 
modelo_aparcamiento <- NewInput.MMC(lambda = 6, mu = 2, c = 5, n = 0)

modelo_aparcamiento_total <- QueueingModel(modelo_aparcamiento)

summary(modelo_aparcamiento_total)
