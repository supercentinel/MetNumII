#include <stdio.h>
#include <stdlib.h>

#include "matriz.h"

typedef struct
{
    long double x, y;
}Punto;

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
            //printf("%LF - %LF / %LF - %LF", dif_div.a[j+1][i-1], dif_div.a[j][i-1], dif_div.a[j+1+i-2][0],dif_div.a[j][0]);
            dif_div.a[j][i] = ((dif_div.a[j+1][i-1] - dif_div.a[j][i-1])/(dif_div.a[j+1+i-2][0] - dif_div.a[j][0])); 
        }
    }
    printf("tabla de diferencias dividas:\n");
    printMatriz(dif_div);    

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
        printf(" * %LF + ", dif_div.a[0][grado-i+1]);

        x += dif_div.a[0][grado-i+1] * pc;
    }

    destruirMatriz(&dif_div);
    return x;
}

int main(void)
{
    int i = 0;

    Punto *puntos;

    puntos = calloc(3, sizeof(Punto));
    puntos[0].x = 1.0;
    puntos[0].y = 475.0;
    puntos[1].x = 2.0;
    puntos[1].y = 532.0;
    puntos[2].x = 3.0;
    puntos[2].y = 495.0;


    /*for(i=0; i<3; i++)
    {
        puntos[i].x = 15.0 + i;
        puntos[i].y = 25.0 - i;
        printf("puntos[%d] = [%LF, %LF] \n", i, puntos[0].x, puntos[0].y);   
    }*/

    diferenciasDivididas(puntos, 3, 1.1, 2);

    return 0;
}