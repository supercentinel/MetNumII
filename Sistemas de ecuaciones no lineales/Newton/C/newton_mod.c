#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct
{
    long double x;
    long double y;
    long double z;
}Punto;

long double f1(long double x, long double y, long double z)
{
    return (x * x) + y + (2.0 * (z * z)) - 10.0;
}

long double f2(long double x, long double y, long double z)
{
    return (5 * x) - (6 * y) + z;
}

long double f3(long double x, long double y, long double z)
{
    return z - (x * x) - (y * y);
}
//con respecto a x
long double f1d(long double x, long double y, long double z)
{
    return 2.0 * x;
}
//con respecto a y
long double f2d(long double x, long double y, long double z)
{
    return -6.0;
}
//con respecto a z
long double f3d(long double x, long double y, long double z)
{
    return 1.0;
}

long double norma(Punto A)
{
    long double s = 0.0;

    s += (A.x * A.x);
    s += (A.y * A.y);
    s += (A.z * A.z);

    return sqrt(s);
}

Punto newton_mod(Punto A, long double tolerancia, int iteraciones)
{
    Punto X = A;
    Punto F_X_k, dF_X_k;
    long double e_a;
    int k = 0;

    while(1)
    {

        F_X_k.x = f1(X.x, X.y, X.z);
        F_X_k.y = f2(X.x, X.y, X.z);
        F_X_k.z = f3(X.x, X.y, X.z);

        dF_X_k.x = f1d(X.x, X.y, X.z);
        dF_X_k.y = f2d(X.x, X.y, X.z);
        dF_X_k.z = f3d(X.x, X.y, X.z);

        e_a = norma(F_X_k);

        printf("|%-4d|%-11.10LF|%11.10LF|%11.10LF|%-10.10LF|\n", k, X.x, F_X_k.x, dF_X_k.x, e_a);
        printf("|    |%-11.10LF|%11.10LF|%11.10LF|\n", X.y, F_X_k.y, dF_X_k.y);
        printf("|    |%-11.10LF|%11.10LF|%11.10LF|\n\n", X.z, F_X_k.z, dF_X_k.z);

        if (e_a <= tolerancia) break;
        if (k >= iteraciones) break;

        X.x = X.x - ((F_X_k.x)/(dF_X_k.x));
        X.y = X.y - ((F_X_k.y)/(dF_X_k.y));
        X.z = X.z - ((F_X_k.z)/(dF_X_k.z));

        k++;
    }

    return X;
}

int main()
{
    Punto X, R;

    X.x = 1.0;
    X.y = 1.0;
    X.z = 2.0;

    R = newton_mod(X, 0.5, 10);

    return 0;
}
