#PRACTICA 2


babyfemales<-read.csv("ontario_top_baby_names_female_1917-2016_english.csv", skip = 1)
#rm(list="ontario_top_baby_names_female_1917-2016_english")
head(babyfemales)
tail(babyfemales)
str(babyfemales)
max(babyfemales$Year)
nombresmasrecientes<-babyfemales[babyfemales$Year==max(babyfemales$Year),]
nrow(nombresmasrecientes)
sum(nombresmasrecientes$Frequency)
nombresmasrecientes
nuevosdatos<-subset(babyfemales,babyfemales$Year==2016)
nuevosdatos
nombresmasrecientes<-nombresmasrecientes[,c("Name","Frequency")]
nombresmasrecientes<-nombresmasrecientes[order(nombresmasrecientes$Frequency,decreasing = TRUE),]
head(as.character(nombresmasrecientes$Name),5)
write.csv(nombresmasrecientes,file = "nombres_mas_populares_female.csv",row.names = FALSE)

#NOMBRE DESEADO

head(babyfemales,6)
head(nombresmasrecientes,6)
#nombredeseado<-readline(prompt = "¿Que nombre quieres buscar?:")
nombredeseado<-"AARON"
frecuenciaanual<-babyfemales[babyfemales$Name==toupper(nombredeseado),c("Year","Frequency")]
frecuenciaanual

#GRAFICO NOMBRE "AVA"

plot.titulo<-paste("AVA",toupper(nombredeseado))
g<-plot(frecuenciaanual,main=plot.titulo,type='s')