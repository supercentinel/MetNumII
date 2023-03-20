#include <stdio.h>
#include <stdlib.h>

#include "newton_mod.h"

long double f1(Punto X)
{
    return (X.x * X.x) + X.y + (2.0 * (X.z * X.z)) - 10.0;
}

long double f2(Punto X)
{
    return (5 * X.x) - (6 * X.y) + X.z;
}

long double f3(Punto X)
{
    return X.z - (X.x * X.x) - (X.y * X.y);
}
//con respecto a x
long double f1d(Punto X)
{
    return 2.0 * X.x;
}
//con respecto a y
long double f2d(Punto X)
{
    return -6.0;
}
//con respecto a z
long double f3d(Punto X)
{
    return 1.0;
}

int main()
{
    Punto X, R;
    long double (*F[3])() = {f1, f2, f3};
    long double (*F_d[3])() = {f1d, f2d, f3d};

    X.x = 1.0;
    X.y = 1.0;
    X.z = 2.0;

    R = newton_mod(X, F, F_d, 0.5, 10);

    return 0;
}