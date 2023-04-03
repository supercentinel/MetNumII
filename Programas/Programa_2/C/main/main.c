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
    char cs, mcs, mcs2, dummy = 'n';
    int i,os = 0;
    int n_puntos, grado = 0;
    long double est, f_est = 0.0;
    Punto *puntos;

    #ifdef __linux__
        os = 1;
    #else
        os = 0;
    #endif

    printf("Metodos numericos II\n");
    printf("Integrantes:\n");
    printf("Alan Ceron Chavez\n");
    printf("Samuel Tadeo Ramirez Reyes\n");
    printf("Andre Miranda Saldana\n");
    printf("Alva Morlan Juab Ignacoip\n");

    printf("\nIntroduce una tecla para continuar\n");
    scanf(" %c", &dummy);

    do
    {
        cs = 'N';
        os == 1 ? system("clear") : system("cls");
        while(cs != 'y')
        {
            puntos = lecturaPuntos(&n_puntos);

            os == 1 ? system("clear") : system("cls");

            printf("|%2s%2c|%9s%9c|%9s%9c|\n", "i", '\0', "x_i", '\0', "f(x_i)", '\0');

            for(i=0; i<n_puntos; i++)
            {
                printf("|%2d%2c|%9LF%9c|%9LF%9c|\n", i, '\0', puntos[i].x, '\0', puntos[i].y, '\0');
            }

            printf("Los datos son correctos?[y/n]\n");
            fflush(stdin);
            scanf(" %c", &cs);
            printf("\n%c\n", cs);

            if(cs == 'y') break;

            free(puntos);
            os == 1 ? system("clear") : system("cls");
        }

        os == 1 ? system("clear") : system("cls");

        bbSortPuntos(puntos, n_puntos);

        printf("Los puntos han sido reacomodados\n");

        printf("|%2s%2c|%9s%9c|%9s%9c|\n", "i", '\0', "x_i", '\0', "f(x_i)", '\0');

        for(i=0; i<n_puntos; i++)
        {
            printf("|%2d%2c|%9LF%9c|%9LF%9c|\n", i, '\0', puntos[i].x, '\0', puntos[i].y, '\0');
        }

        do
        {
            do
            {
                printf("Introduce el punto a aproximar por diferencias divididas\n");
                fflush(stdin);
                scanf("%LF", &est);

                if(est > puntos[0].x && est < puntos[n_puntos-1].x) break;

                printf("El punto no esta dentro del intervalo[x_o, x_n]\n");
            }while((est < puntos[0].x) || (est > puntos[n_puntos-1].x));

            do
            {
                printf("Introduce el grado de polinomio a estimar\n");
                fflush(stdin);
                scanf("%d", &grado);

                if(grado<1)
                {
                    printf("El grado del polinomio no puede ser menor a 1\n");
                }
                if(grado<n_puntos-1) break;

                printf("El grado del polinomio es mayor a puntos-1\n");
            }while(grado>n_puntos-1);


            os == 1 ? system("clear") : system("cls");

            f_est = diferenciasDivididas(puntos, n_puntos, est, grado);

            printf("Estimacion de %LF con polinomio de grado %d\n%LF\n", est, grado, f_est);

            printf("Hacer otra estimacion con los mismos puntos?[y/n]\n");
            fflush(stdin);
            scanf(" %c", &mcs);


            if(mcs == 'y')
            {
                os == 1 ? system("clear") : system("cls");
                printf("|%2s%2c|%9s%9c|%9s%9c|\n", "i", '\0', "x_i", '\0', "f(x_i)", '\0');

                for(i=0; i<n_puntos; i++)
                {
                    printf("|%2d%2c|%9LF%9c|%9LF%9c|\n", i, '\0', puntos[i].x, '\0', puntos[i].y, '\0');
                }
            }

        }while(mcs == 'y');

        printf("Hacer otra estimacion con puntos diferentes?[y/n]\n");
        fflush(stdin);
        scanf(" %c", &mcs2);
        free(puntos);
    }while(mcs2 == 'y');

    return 0;
}
