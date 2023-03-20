#ifndef NEWTON_MOD
#define NEWTON_MOD

typedef struct
{
    long double x;
    long double y;
    long double z;
}Punto;

long double norma(Punto X);
Punto newton_mod(Punto X, long double (**F)(Punto X), long double (**F_d)(Punto X), long double tolerancia, int iteraciones);

#endif
