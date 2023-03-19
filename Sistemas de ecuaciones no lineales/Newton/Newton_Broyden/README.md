# Newton Broyden

a difrencia de las variaciones anteriores está si usa la matriz Jacobiana pero solo a la primera iteración gracias al teorema de Sherman Morrison.

### Sherman Morrison

Si $A$ es una matriz no singular y $X$ y $Y$ son vectores entonces:

$$
A+XY^t\neq1
$$

Y su inversa está dada por :

$$
(A+XY^t)^{-1}=A^{-1}-\frac{A^{-1}XY^tA^{-1}}{1+Y^tA^{-1}X}
$$

Con este teorema podemos aproximar la inversa de la matriz Jacobiana de la siguiente manera:

$$
J^{(1)}\approx A^{(1)}=\frac{F(X^{(1)})-F(X^{(0)})}{X^{(1)}-X^{(0)}}\newline
$$

Y su inversa esta dada por:

$$
{J^{(1)}}^{-1} \approx {A^{(1)}}^{-1}=\frac{X^{(1)}-X^{(0)}}{F(X^{(1)})-F(X^{(0)})}\newline
$$

Pero para obtener una primera iteración es necesaria la Jacobiana, que, después de la primera iteración será remplazada por ${A^{(k)}}^{-1}$ de la siguiente manera:

$$
A^{(k)}=A^{(k-1)}+\frac{(\Delta F^{(k)}-A^{(k-1)}\Delta X^{(k)}){(\Delta X^{(k)})^t}}{{||(\Delta X^{(k)})||}^2_2}
$$

Y calculamos el error con base a la norma de $F = ||F(X^k)||$
