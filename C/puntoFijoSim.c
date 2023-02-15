#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct
{
	long double x;
	long double y;
}Punto;


long double g_1(long double x, long double y)
{
	long double _x = ((x * x) - y + 0.5)/2;

	return _x;
}

long double g_2(long double x, long double y)
{
	long double _y = (-(x * x) - (4 * (y * y)) + (8 * y) + 4)/(8);

	return _y;
}

Punto punto_fijo(long double x_0, long double y_0, long double tolerancia, int iteraciones)
{
	unsigned int k = 0;
	long double x_km1, y_km1, E_a = 1.0;
	Punto p;

	p.x = x_0;
	p.y = y_0;
	printf("|%-4s|%-12s|%-12s|%-12s|\n", "k", "x^k", "y^k", "E_a");

	while (1)
	{

	    x_km1 = p.x;
		y_km1 = p.y;

        p.x = g_1(p.x, p.y);
        p.y = g_2(p.x, p.y);

        //calculo del error
	    E_a = sqrtl(powl(p.x - x_km1, 2) + powl(p.y - y_km1, 2));


		printf("|%-4d|%-12LF|%-12LF|%-12LF|\n", k, p.x, p.y, E_a);

		if(E_a < tolerancia && k > 0) break;
		if(k > iteraciones) break;

		k++;
	}

	return p;
}


int main()
{
	Punto p;

	p = punto_fijo(0, 1, 0.005, 10);

	return 0;
}
