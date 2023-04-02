#ifndef DIFERENCIAS
#define DIFERENCIAS

#include <stdio.h>
#include <stdlib.h>

#include "matriz.h"

typedef struct
{
    long double x, y;
}Punto;

long double diferenciasDivididas(Punto *puntos, int n_puntos, long double estimacion, int grado);
void printDifDiv(Matriz difDiv, int grado);
Punto crearPunto(long double x, long double y);
#endif