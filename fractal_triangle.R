rm(list = ls())
gc()

library(dplyr)
library(ggplot2)
library(data.table)

#Número de puntos a graficar:
#Number of point to plot
repeticiones <- 500000

#Crear un triangulo equilatero al azar
#Create a equilateral random triangle

##Primero, dos puntos al azar, entre 0 y 1:
##First, two random points, between 0 and 1: 

vertices <- matrix(runif(4), ncol = 2)

##Calcular la distancia entre ambos:
##Get distance between them:
distancia <- dist(vertices)[1]


#Tercer vértice que construya el triangulo equilatero
##Dados los dos primeros puntos, existen dos posibilidades para el tercer punto. Este se elije al azar
#Third vertex to complete equilateral triangle
##Given the first two vertexes, there are two posibilities for the third one. It's randomly selected
tercer.vertice <- 0.5 * colSums(vertices) + sample(c(1, -1), 1) *  sqrt((distancia**2/(diff(vertices[,1])**2 + diff(vertices[,2])**2))-0.25) * c(diff(vertices[,2]), -diff(vertices[,1]))

vertices <- rbind(vertices, tercer.vertice)

#Verifico que sea un triangulo  equilatero:
#Checking that the triangle is equilateral
dist(vertices)


#Generar al azar un punto dentro del triangulo:
#Randomly create a point inside the triangle:
#Source: https://www.cs.princeton.edu/~funk/tog02.pdf
r <- runif(2)
punto.inicial <- (1-sqrt(r[1]))*vertices[1,] + sqrt(r[1]) * (1 - r[2]) * vertices[2,] + (r[2]*sqrt(r[1]))*vertices[3, ]


#Encuentro el punto intermedio entre el punto al azar y un vertice al azar. El proceso se repite las veces indicada:
#Finding the middle point between the random point and one of the vertexes, randomly selected. Repeat the process as many times as it was commanded:

puntos.x <- vector("numeric", repeticiones)
puntos.y <- puntos.x

for(i in 1:repeticiones){
  cat("\rRepetición", i, "de", repeticiones)
  cual.vertice <- sample(1:3, 1)
  punto.inicial <- c(mean(c(vertices[cual.vertice, 1], punto.inicial[1])), mean(c(vertices[cual.vertice, 2], punto.inicial[2])))
  puntos.x[i] <- punto.inicial[1]
  puntos.y[i] <- punto.inicial[2]
}

puntos.nuevos <- data.table(V1 = puntos.x, V2 = puntos.y) %>%
  rbind(vertices)

#Graficar los puntos en un lienzo vacío:
#Plot the points in a empty canvas:

plot.triangulos <-  puntos.nuevos %>%
  ggplot(aes(x = V1, y = V2)) +
  geom_point(colour = "#E27A06", size = 0.01, shape = 17) +
  theme_void() +
  coord_equal()

#Guardado como imagne
#Save as image
ggsave("fractal_triangle.png", plot.triangulos, width = 25, height = 25, dpi = 800)
