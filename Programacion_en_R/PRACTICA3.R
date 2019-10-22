#EJERCICIO 1

# 1a) Función adicional de calculo de los números de fibonacci

fibonacci <- function(n) {
  if (n < 1) {
    return("Selecciona valores mayor o igual a 1")
  }
  
  if (n < 3) {
    return(c(0, 1)[1:n])
  } else {
    x<-c(0:(n-1))
    for (i in 3:n) {
      x[i]<-x[i-1] + x[i-2]
    }
    return(x)
  }
}

# 1b) Función de calculo de n ternas pitagóricas procedentes de una 4-secuencia de la serie de fibonacci

nternas<-function(n) {
  if (n < 1) {
    return("Selecciona valores mayor o igual a 1")
  }
  else
    cuaternaf<-c(fibonacci(n+4))
  m<-matrix(nrow = n, ncol = 3)
  for (i in 1:n){
    v1<-cuaternaf[(i+1)]
    v2<-cuaternaf[(i+2)]
    v3<-cuaternaf[(i+3)]
    v4<-cuaternaf[(i+4)]
    a<-v1*v4
    b<-2*v2*v3
    h<-(v2*v2)+(v3*v3)
    m[i, ]<-c(a,b,h)
  }
  return(m)
}

nternas(5)