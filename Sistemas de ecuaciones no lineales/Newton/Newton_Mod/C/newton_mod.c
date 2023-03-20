#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct
{
    long double x;
    long double y;
    long double z;
}Punto;

long double norma(Punto X)
{
    long double s = 0.0;

    s += (X.x * X.x);
    s += (X.y * X.y);
    s += (X.z * X.z);

    return sqrt(s);
}

Punto newton_mod(Punto X, long double (**F)(Punto X), long double (**F_d)(Punto X), long double tolerancia, int iteraciones)
{ 
    Punto X_k = X;
    Punto F_X_k, dF_X_k;
    long double e_a;
    int k = 0;

    while(1)
    {

        F_X_k.x = F[0](X_k);
        F_X_k.y = F[1](X_k);
        F_X_k.z = F[2](X_k);

        dF_X_k.x = F_d[0](X_k);
        dF_X_k.y = F_d[1](X_k);
        dF_X_k.z = F_d[2](X_k);

        e_a = norma(F_X_k);

        printf("|%-4d|%-11.10LF|%11.10LF|%11.10LF|%-10.10LF|\n", k, X_k.x, F_X_k.x, dF_X_k.x, e_a);
        printf("|    |%-11.10LF|%11.10LF|%11.10LF|\n", X_k.y, F_X_k.y, dF_X_k.y);
        printf("|    |%-11.10LF|%11.10LF|%11.10LF|\n\n", X_k.z, F_X_k.z, dF_X_k.z);

        if (e_a <= tolerancia) break;
        if (k >= iteraciones) break;

        X_k.x = X_k.x - ((F_X_k.x)/(dF_X_k.x));
        X_k.y = X_k.y - ((F_X_k.y)/(dF_X_k.y));
        X_k.z = X_k.z - ((F_X_k.z)/(dF_X_k.z));

        k++;
    }

    return X_k;
}