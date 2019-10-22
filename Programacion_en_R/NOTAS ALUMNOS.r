#MI NOTA

a<-"asitencia"
p<-"practicas"
e<-"examen"
minota<-function(a=10,p,e){
  nota<-a*.1+p*.4+e*.5
  if(e<5)
    return(min(4,nota))
  else
    return(nota)
}
minota(10,10,10)
minota(10,10,4)
minota(5,5,4)
minota(1,5,4)
minota(1,1,4)
minota(p=7,e=5)
minota(0,7,5)

#FUNCION no_superan

nombres<-c("Maria","Marta","Javier","Alvaro","Beltran")
notacalculada<-c(4.5,6,7.3,2.5,5.6)
notadefinitiva<-c(4,4,7.3,2.5,4)
notasalumnos<-data.frame(nombres,notacalculada,notadefinitiva)

nosuperan <- function(notasalumnos){
  
p<-0
  
nombressuspensos<-c()
  
for(i in 1:length(notasalumnos$nombres)){ #llamamos del data frame solo a los nombres, va de uno en uno comprobando todos
    
    if(notacalculada[i]!=notadefinitiva[i]|notadefinitiva[i]<5){
      p=p+1
       nombressuspensos<-append(nombressuspensos,nombres[i])
    }
    print(p)
  }
  print(nombressuspensos)
}

nosuperan(notasalumnos)
