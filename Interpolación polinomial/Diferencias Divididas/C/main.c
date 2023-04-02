#include <stdlib.h>
#include <stdio.h>

#include "matriz.h"
#include "diferencias_divididas.h"

int main(void)
{
    int i = 0;

    Punto *puntos;

    puntos = calloc(5, sizeof(Punto));
    puntos[0] = crearPunto(1.73, 8.1);
    puntos[1] = crearPunto(1.82, 8.3);
    puntos[2] = crearPunto(2.61, 7.8);
    puntos[3] = crearPunto(5.22, 2.4);
    puntos[4] = crearPunto(8.26, -1.7);

    /*for(i=0; i<3; i++)
    {
        puntos[i].x = 15.0 + i;
        puntos[i].y = 25.0 - i;
        printf("puntos[%d] = [%LF, %LF] \n", i, puntos[0].x, puntos[0].y);   
    }*/

    diferenciasDivididas(puntos, 5, 1.1, 4);

    return 0;
}