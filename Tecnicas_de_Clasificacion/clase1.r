#Generamos una muestra normal de media 3000 y desviación típica 2000 para la población I 
#Generamos una muestra normal de media 10000 y desviación típica 2000 para la población II 

x1=rnorm(1000)*2000+3000 
X1=matrix(x1,nrow=1000) 
y1=rep(1,1000) 
Y1=matrix(y1,nrow=1000) 
x2=rnorm(1000)*2000+10000 

X2=matrix(x2,nrow=1000) 
y2=rep(2,1000) 
Y2=matrix(y2,nrow=1000) 
X=rbind(X1,X2) 
Y=rbind(Y1,Y2) 

#Representación gráfica de las funciones de densidad anteriores 

a1=seq(-1000,7000,100) 
b1=dnorm(a1,mean=3000,sd=2000) 
a2=seq(6000,14000,100) 
b2=dnorm(a2,mean=10000,sd=2000) 
A1=matrix(a1,nrow=81) 
A2=matrix(a2,nrow=81) 
B1=matrix(b1,nrow=81) 
B2=matrix(b2,nrow=81) 
A=rbind(A1,A2) 
B=rbind(B1,B2) 
plot(A,B) 

#Cálculo del valor de c, límite de la función discriminante 

c=(mean(x1)+mean(x2))/2 
c 

#Seleccionar casos con error de asignación 

ErrorX1=subset(x1,x1>c) 
ErrorX2=subset(x2,x2<c) 
tasaError=(nrow(ErrorX1)+nrow(ErrorX2))/2000 
tasaError
