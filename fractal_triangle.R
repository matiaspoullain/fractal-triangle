rm(list = ls())
gc()

library(tidyverse)
library(data.table)

#Funciones:


#Creo un triangulo equilatero al azar
##Primero dos puntos al al azar:

vertices <- matrix(runif(4), ncol = 2)

##Calculo la distancia entre amvos
distancia <- dist(vertices)[1]


#Tercer vertice que construya el triangulo equilatero

tercer.vertice <- 0.5 * colSums(vertices) + sqrt((distancia**2/(diff(vertices[,1])**2 + diff(vertices[,2])**2))-0.25) * c(diff(vertices[,2]), -diff(vertices[,1]))

vertices <- rbind(vertices, tercer.vertice)

#Verifico que sea un triangulo  equilatero:
dist(vertices) 

# Genero al azar un punto dentro del triangulo:
r <- runif(2)
punto.inicial <- (1-sqrt(r[1]))*vertices[1,] + sqrt(r[1]) * (1 - r[2]) * vertices[2,] + (r[2]*sqrt(r[1]))*vertices[3, ]


#Busco el punto intermedio entre el punto al azar y un vertice al azar:

repeticiones <- 10000

puntos.x <- vector("numeric", repeticiones)
puntos.y <- puntos.x

for(i in 1:repeticiones){
  cat("\rRepetición", i, "de", repeticiones)
  cual.vertice <- sample(1:3, 1)
  punto.inicial <- c(mean(c(vertices[cual.vertice, 1], punto.inicial[1])), mean(c(vertices[cual.vertice, 2], punto.inicial[2])))
  puntos.x[i] <- punto.inicial[1]
  puntos.y[i] <- punto.inicial[2]
}

puntos.nuevos <- data.table(V1 = puntos.x, V2 = puntos.y)


puntos.nuevos %>%
  ggplot(aes(x = V1, y = V2)) +
  geom_point()


vertices %>%
  as.data.frame() %>%
  ggplot(aes(x = V1, y = V2)) +
  geom_point(size = 0.1) +
  geom_polygon(col = "black", fill = "transparent") +
  geom_point(data = puntos.nuevos, colour = "blue")