# Polinomio de Lagrange

Para poder interpolar un conjunto de $n+1$ puntos se debe representar a y como función única de $y$
Para esto usamos el polinomio de Lagrange:
Si $x_0,x_1,\ldots x_n$ son $n+1$ números diferentes y $f$ es una función cuyos valores están dados en estos puntos, entonces existe un polimonio **único** de grado a lo más $n$ con la propiedad de que $f(x_k)=P(x_k)$ para cada $j=0,1,\dots,n$. El polinomio está dado por:

$$

\sum^n_{k=0} f(x_k)L_{k,n}(X) = P_n(x)

$$

Y qué es $L_{k.n}?$ Pues es el cociente de Lagrange que está dado por:

$$

\prod^n_{j=0 \\ j\neq k}=\frac{(x-x_j)}{(x_k-x_j)}

$$
