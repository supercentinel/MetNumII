# Método de Newton

El método de newton consiste en resolver el sistema de ecuaciones mediante el
uso de la matriz Jacobiana que es la matriz de todas las derivadas parciales del
sistema de ecuaciones.

$$
J = \begin{bmatrix}
f_{1x_1} && f_{1x_2} && \cdots && f_{1x_n} \\
f_{2x_1} && f_{2x_2} && \cdots && f_{2x_n} \\
\vdots && \vdots && \ddots && \vdots \\
f_{nx_1} && f_{nx_2} && \cdots && f_{nx_x}
\end{bmatrix}
$$

Ya con la matriz jacobiana es posible iterar a $X^{k+1}$ de la siguiente manera

$$
X^{k+1} = X^K - {J(X^k)}^{-1}F(X^k)
$$

Calculamos el error con respecto a:

$$
    E_r=\frac{||X^{k+1}-X^k||}{||X^{k+1}||}
$$

Como se puede observar para cada iteración es necesario calcular la matriz inversa de la Jacobiana. Eso es muy costoso!!
