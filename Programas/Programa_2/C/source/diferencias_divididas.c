#include <stdio.h>
#include <stdlib.h>

#include "matriz.h"

typedef struct
{
    long double x, y;
}Punto;

Punto crearPunto(long double x, long double y)
{
    Punto _punto;

    _punto.x = x;
    _punto.y = y;
    
    return _punto;
}

void printDifDiv(Matriz difDiv, int grado)
{
    int i,j = 0;

    printf("|%2s%2c|%9s%9c|%9s%9c|", "i", '\0', "x_i", '\0', "f(x_i)", '\0');

    for(i=0; i<grado; i++)
    {
        printf("%7s[%d]%8c|", "f", i, '\0');        
    }

    printf("\n");

    for(i=0; i<grado+1; i++)
    {
        printf("|%2d%2c|", i, '\0');
        for(j=0; j<grado+2; j++)
        {
            printf("%-17.8LF|", difDiv.a[i][j]);
        }
        printf("\n");
    }
}

long double diferenciasDivididas(Punto *puntos, int n_puntos, long double estimacion, int grado)
{
    int i,j = 0;
    long double pc;
    long double x = 0;
    Matriz dif_div = crearMatriz(n_puntos, n_puntos+1);

    //llenando las dos primeras columnas de la tabla de diferencias
    for(i=0; i<n_puntos; i++)
    {
        dif_div.a[i][0] = puntos[i].x;
        dif_div.a[i][1] = puntos[i].y;
    }

    //construyendo la tabla de diferencias divididas
    for(i=2; i<dif_div.n; i++)
    {
        for(j=0; j<dif_div.m-i+1; j++)
        {
            dif_div.a[j][i] = ((dif_div.a[j+1][i-1] - dif_div.a[j][i-1])/(dif_div.a[j+i-1][0] - dif_div.a[j][0])); 
        }
    }

    printf("tabla de diferencias dividas:\n");
    printDifDiv(dif_div, grado);    

    printf("polinomio de diferencias divididas:\n");
    //construyendo el polinomio
    for(i=0; i<grado+1; i++)
    {
        pc = 1.0;
        for(j=0; j<grado-i; j++)
        {
            pc *= estimacion - dif_div.a[j][0];
            printf("(x -  %LF)", dif_div.a[j][0]);
        }

        x += dif_div.a[0][grado-i+1] * pc;

        if(i == grado)
        {
            printf("%LF", dif_div.a[0][grado-i+1]);
            continue;
        }

        printf(" * %LF + ", dif_div.a[0][grado-i+1]);
    }

    destruirMatriz(&dif_div);
    return x;
}