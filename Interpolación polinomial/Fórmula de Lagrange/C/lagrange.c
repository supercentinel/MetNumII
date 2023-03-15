#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    long double x;
    long double y;
}Punto;

Punto crearPunto(long double x, long double y)
{
    Punto p;

    p.x = x;
    p.y = y;

    return p;
}

long double lagrange(Punto puntos[], int inicio,  int final, long double estimacion)
{
    int k, j;
    long double sum, prod;
    sum = 0.0;

    for(k=inicio; k<=final; k++)
    {
        prod = 1.0;
        for(j=inicio; j<=final; j++)
        {
            if(k != j)
            {
                prod = prod * ((estimacion - puntos[j].x)/(puntos[k].x - puntos[j].x));
            }
        }
        sum += prod * puntos[k].y;
    }

    return sum;
}

int main()
{
    Punto puntos[5];
    int i = 0;

    puntos[0] = crearPunto(1.73, 8.1);
    puntos[1] = crearPunto(1.82, 8.3);
    puntos[2] = crearPunto(2.61, 7.8);
    puntos[3] = crearPunto(5.22, 2.4);
    puntos[4] = crearPunto(8.26, -1.7);

    long double est = lagrange(puntos, 1, 2, 2.5);

    printf("estimacion = %15.15LF", est);

    return 0;
}
