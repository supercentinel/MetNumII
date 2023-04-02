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
    char cs = 'n';
    int i,os = 0;
    int n_puntos = 0;
    Punto *puntos;

    #ifdef __linux__
        os = 1;
    #else
        os = 0;
    #endif

    while(cs != 'y')
    {
        puntos = lecturaPuntos(&n_puntos);

        for(i=0; i<n_puntos; i++)
        {
            printf("punto[%d] x = %LF y = %LF\n", i, puntos[i].x, puntos[i].y);
        }

        printf("Los datos son correctos?[y/n]\n");
        fflush(stdin);
        scanf(" %c", &cs);


        if(cs == 'y') break;

        free(puntos);
        os == 1 ? system("clear") : system("cls");
    }


    free(puntos);
    return 0;
}
