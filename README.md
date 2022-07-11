# Triangulo fractal

Este repositorio contiene un script en R que dibuja puntos *al azar* formando, en su conjunto, triangulos equilateros dentro de triangulos equilateros con un patrón fractal.

Sólo hace eso...

No es el repositorio más útil que haya visto, pero sí es interesante. El dibujo final se construye con una serie de reglas muy simples:
  1. Crear un triangulo equilatero al azar.
  2. Crear un punto al azar dentro del triangulo.
  3. Encontrar el punto intermedio entre el último punto creado y uno de los vértices originales al azar.
  4. Se repite el punto anterior *N* veces.

Los parámetros a modificar son *N* y *size*:
  - *N* es la cantidad de repeticiones y la cantidad de puntos nuevos dentro del triangulo original. A mayor *N*, más detallada será la forma del triangulo y sus triangulos fractales.
  - *size* es el largo de los lados de la imágen final en centímetros. A mayor tamaño, más chicos se verán los puntos dibujados y habrá más espacio entre ellos, ideal para un *N* grande. Sin embargo, el peso de la imágen crecerá muy rápido.

Pruebe distintas combinaciones, puede setear una semilla para hacer reproducibles sus resultados.

¿Cuanta profundidad de triángulos puede alcanzar?

---------------------------------------

# Fractal triangle

This repository contains an R script that draws *random* points forming, as a whole, equilateral triangles inside equilateral triangles with a fractal pattern.

That's all it does...

Not the most useful repository you've ever seen, but certainly interesting. The final drawing is constructed by following a very simple set of rules:
  1. Create a random equilateral triangle.
  2. Create a random point inside the triangle.
  3. Find the intermediate point between the last point created and one of the original random vertices.
  4. Repeat the previous point *N* times.

The parameters to modify are *N* and *size*:
  - *N* is the number of repetitions and the number of new points inside the original triangle. The more *N*, the more detailed will be the shape of the triangle and its fractal triangles.
  - *size* is the length of the sides of the final image in centimeters. The larger the size, the smaller the drawn points will look and the more space there will be between them, ideal for a large *N*. However, the weight of the image will grow very fast.

Try different combinations, you can set a seed to make your results reproducible.

How much depth of triangles can you reach?
