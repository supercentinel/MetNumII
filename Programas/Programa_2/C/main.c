#include <stdlib.h>
#include <stdio.h>

#include "matriz.h"
#include "diferencias_divididas.h"


Punto * lecturaPuntos(int *n_puntos)
{
    Punto *puntos;
    int i = 0;

    printf("Introduce el numero de puntos> ");
    fflush(stdin);
    scanf("%d", n_puntos);

    puntos = calloc(*n_puntos, sizeof(Punto));

    printf("Introduce los valores de los puntos\n");

    for(i=0; i<*n_puntos; i++)
    {
        printf("x_%d> ", i+1);
        fflush(stdin);
        scanf("%LF", &puntos[i].x);
        printf("y_%d> ", i+1);
        fflush(stdin);
        scanf("%LF", &puntos[i].y);
    }

    return puntos;
}

int main(void)
{

    int i = 0;
    int n_puntos = 0;
    Punto *puntos;

    puntos = lecturaPuntos(&n_puntos);

    #ifdef __linux__
        system("clear");
    #else
        system("cls");
    #endif

    for(i=0; i<n_puntos; i++)
    {
        printf("punto[%d] x = %LF y = %LF\n", i, puntos[i].x, puntos[i].y);
    }



    free(puntos);
    return 0;
}
