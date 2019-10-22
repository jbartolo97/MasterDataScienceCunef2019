###EJERCICIO MARKOV

library("markovchain")

estados<- c("A", "B", "C")
byRow <- TRUE
mt <- matrix(data = c(0.9,0.04,0.06,0.14,0.76,0.1,0.1,0.08,0.82), byrow = byRow,
             nrow = 3,dimnames = list(estados, estados))
compa�ias <- new("markovchain", states = estados, byrow = byRow,
               transitionMatrix = mt, name = "COMPA�IAS")
compa�ias

