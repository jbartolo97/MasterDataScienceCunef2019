
################### EJERCICIO CLIMA #####################################

library("markovchain")

estados<- c("soleado", "nublado", "lluvioso")
byRow <- TRUE
mt <- matrix(data = c(0.60, 0.3, 0.1,0.4, 0.4, 0.2,0.25, 0.45, 0.30), byrow = byRow,
             nrow = 3,dimnames = list(estados, estados))
cmclima <- new("markovchain", states = estados, byrow = byRow,
               transitionMatrix = mt, name = "clima")
cmclima

plot(cmclima)

sinicial <- c(0, 1, 0)
dosdespues <- sinicial * (cmclima * cmclima)
sietedespues <- sinicial * (cmclima ^ 7)
dosdespues
sietedespues

#Estado estacionario
steadyStates(cmclima)

#Simulacion aleatoria del estado del clima durante 100 días (comprobar que >n... <DS)
simulacionclima <- rmarkovchain(n = 1000, object =cmclima , t0 = "nublado")

#simulacion del estado del tiempo proxima semana
simulacionclima[1:7]

#Estimador maximo verosimilitud (mle=maximum likelihood estimator)
emvclima <- markovchainFit(data = simulacionclima, method = "mle", name = "EMVclima")                                 
#markovchainFit, devuelve una CM de una secuencia dada.

emvclima$estimate

emvclima$standardError

