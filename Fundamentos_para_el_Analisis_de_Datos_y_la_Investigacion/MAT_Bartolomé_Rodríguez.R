#PRACTICA NUMERO 3 de Fundamentos para el Analisis de Datos
#Ejercicios de Matematicas

library(mosaicCalc)
library(mosaic)

#1. Usando D(), encuentra la derivada de: 3*x^2 - 2x + 4 ~ x.

j <- mosaicCalc::D(3*x^2 - 2*x + 4 ~ x)
j    #el resultado que obtenemos es la función derivada

#a. Cual es el valor de la derivada en  x = 0
j(0) #obtenemos el resultado

#b. ¿Como seria la grafica de la funcion? 
plotFun(j, x.lim=range(0,10)) # la opcion b


#2. Encontrar la derivada de 5*exp(.2*x) ~ x.
a <- mosaicCalc::D(5*exp(.2*x) ~ x)
a #el resultado que obtenemos es la función derivada

#a. Cual es el valor de la derivada en  x = 0
a(0) #obtenemos el resultado

#b. Relaciond dela funcion original y su derivada con gráficos
lorig <- (5*exp(.2*x) ~ x)
plotFun(lorig, x.lim=range(0,10))
plotFun(a, x.lim=range(0,10)) 
#Respuesta es la b)

#3. Utiliza R para sacar la derivada de la funcion exp(-(x^2)) ~ x.Depsues, dibuja la grafica de esa derivada desde x = -2 hasta x = 2. Como es el grafico?
v <- mosaicCalc::D(exp(-(x^2)) ~ x)
v
plotFun(v, x.lim=range(-2, 2)) #Respuesta es la c)

#4. Â¿Cual sera el valor de esta derivada?: D(fred^2 - ginger), fred es la variable y ginger la constante

i <- mosaicCalc::D(fred^2 - ginger ~ fred)
i # f(fred) = 2 * fred

# ahora al reves, fred es una constante, el resultado
# seria:
e <- mosaicCalc::D(fred^2 - ginger ~ ginger)
e # f(ginger) = -1


#5. D() para conseguir la tercera derivada de cos(2*t). 
t1 <- mosaicCalc::D(cos(2*t) ~ t)
t2 <- mosaicCalc::D(-(sin(2 * t) * 2) ~ t)
t3 <- mosaicCalc::D(-(cos(2 * t) * 2 * 2) ~ t)
t3 # respuesta c

#  cuarta derivada?
t4 <- mosaicCalc::D(sin(2 * t) * 2 * 2 * 2 ~ t)
t4 # respueta d


#6. Grafica de la cuarta derivada de la funcion cos(2*t^2 ~ t) from t = 0 to t = 5. Como es la grafica?
c <- mosaicCalc::D(cos(2*t^2) ~ t)
c2 <- mosaicCalc::D(-(sin(2 * t^2) * (2 * (2 * t))) ~ t)
c3 <- mosaicCalc::D(-(cos(2 * t^2) * (2 * (2 * t)) * (2 * (2 * t)) + sin(2 * t^2) * (2 * 2)) ~ t)
c4 <- mosaicCalc::D(-((cos(2 * t^2) * (2 * 2) - sin(2 * t^2) * (2 * (2 * t)) * (2 * (2 * t))) * (2 * (2 * t)) + cos(2 * t^2) * (2 * (2 * t)) * (2 * 2) + cos(2 * t^2) * (2 * (2 * t)) * (2 * 2)) ~ t)
c4
plotFun(c4, x.lim=range(0, 5)) # respuesta c
# las funciones complicadas que aparecen en la cuarta derivada son las que incluye la respuesta c

#7. Funcion x*sin(y) con las variables x e y, realizar funciones derivadas diferentes; una parcial con respecto a x, una
# otra con respecto a y, la segunda derivada parcial de x e y, y unas parciales mezcladascladas: 
px <- mosaicCalc::D(x*sin(y) ~ x)
py <- mosaicCalc::D(x*sin(y) ~ y)
px2 <- mosaicCalc::D(sin(y) ~ x)
py2 <- mosaicCalc::D(x * cos(y) ~ y)
pxy <- mosaicCalc::D(x*sin(y) ~ x&y)
pyx <- mosaicCalc::D(x*sin(y) ~ y&x)
px(1,2)
py(2,1)
px(3,0)
py(0,3)
# primera respuesta falsa

px2(2,4)
py2(4,2)
px2(1,0)
py2(0,1)
# segunda respuesta falsa  

pxy(0,1)
pyx(1,0)
pxy(3,1)
pyx(1,3)
# tercera respuesta verdadera

#MUCHAS GRACIAS