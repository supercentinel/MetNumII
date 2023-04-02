#include <stdlib.h>
#include <stdio.h>

#include "matriz.h"
#include "diferencias_divididas.h"

void bbSortPuntos(Punto *puntos, int n_puntos)
{
    int i,j = 0;
    Punto temp;

    for(i=0; i<n_puntos; i++)
    {
        for(j=0; j<n_puntos-1; j++)
        {
            if(puntos[j].x > puntos[j+1].x)
            {
                temp = puntos[j];
                puntos[j] = puntos[j+1];
                puntos[j+1] = temp;
            }
        }
    }
}

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
    int n_puntos, grado = 0;
    long double est = 0.0;
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

    os == 1 ? system("clear") : system("cls");

    bbSortPuntos(puntos, n_puntos);

    printf("Los puntos han sido reacomodados\n");
    for(i=0; i<n_puntos; i++)
    {
        printf("punto[%d] x = %LF y = %LF\n", i, puntos[i].x, puntos[i].y);
    }

    do{
        printf("Introduce el punto a aproximar por diferencias divididas\n");
        fflush(stdin);
        scanf("%LF", &est);

        if(est > puntos[0].x || est < puntos[n_puntos-1].x) break;

        printf("El punto no esta dentro del intervalo[x_o, x_n ]");
    }while((est < puntos[0].x) || (est > puntos[n_puntos-1].x));


    os == 1 ? system("clear") : system("cls");

    while(grado+1>n_puntos)
    {

    }

    free(puntos);
    return 0;
}
