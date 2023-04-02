#ifndef MATRIZ_H
#define MATRIZ_H

typedef struct 
{
    //con m renglones y con n columnas
    int m, n;
    //puntero a void para cualquier tipo de matriz
    long double **a;
}Matriz;

Matriz crearMatriz(int renglones, int columnas);
void destruirMatriz(Matriz *a);
void printMatriz(Matriz a);

#endif