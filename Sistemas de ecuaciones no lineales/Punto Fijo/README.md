# Punto fijo

El método del punto fijo es un método iterativo que dado un punto inicial itera para encontrar una solución a un sistema de ecuaciones.

$$
F(X)=\begin{bmatrix}f_1(X) \\ f_2(X) \\ f_n(X) \end{bmatrix}=0
$$

Para poder usar este método primero se debe resolver una de las derivadas parciales para cada una de las ecuaciones. Despúes es necesario
resolver una de las variables con una ecuacion del sistema.

$$
  x_n^{k+1} = g_n(x_1, x_2, \ldots, x_n)
$$

## Iteraciones sucesivas

En esta variación del método al iterar podemos utilizar los valores de $x^{k+1}_{i-1}$ para la siguiente iteración.

$$
x^{k+1}_{2}(X)=(x^{k+1}_1,\ldots,x_n)
$$
