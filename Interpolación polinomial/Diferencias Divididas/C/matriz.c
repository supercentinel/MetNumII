#include <stdio.h>
#include <stdlib.h>

#include "matriz.h"

Matriz crearMatriz(int renglones, int columnas)
{
    Matriz a;
    int i = 0;

    a.m = renglones;
    a.n = columnas;

    a.a = calloc(renglones, sizeof(long double));
    for(i=0; i < renglones; i++)
    {
        a.a[i] = calloc(columnas, sizeof(long double));
    }

    return a;
}

void destruirMatriz(Matriz *a)
{
    int i,j = 0;

    for(i=0; i< a->m; i++)
    {
        free(a->a[i]);
    }

    free(a->a);
}

void printMatriz(Matriz a)
{
    int i,j = 0;

    for(i=0; i<a.m; i++)
    {
        for(j=0; j<a.n; j++)
        {
            printf(" %LF ", a.a[i][j]);
        }
        printf("\n");
    }
}