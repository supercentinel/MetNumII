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
	long double x_k, y_k, E_a = 0;
	Punto p, pe;

	p.x = x_0;
	p.y = y_0;
	printf("|%-4s|%-12s|%-12s|%-12s|\n", "k", "x^k", "y^k", "E_a");

	while (1)
	{
		
		pe.x = p.x - x_k;
		pe.y = p.y - y_k;
		
		x_k = p.x;
		y_k = p.y;
		
		//printf("\n%LF, %LF\n", pe.x, pe.y);

	if (pe.x == 0)
	{
		pe.y = pow(pe.y, 2);
		E_a = sqrt(pe.y);
		//printf("1\n");
	}else if (pe.y == 0)
	{
		pe.x = pow(pe.x, 2);
		E_a = sqrt(pe.x);
		//printf("2\n");
	}else
	{
		pe.y = pow(pe.y, 2);
		pe.x = pow(pe.x, 2);
		E_a = sqrt(pe.x + pe.y);
		//printf("3\n");
	}
		
		printf("|%-4d|%-12LF|%-12LF|%-12LF|\n", k, x_k, y_k, E_a);
		
		if(E_a < tolerancia && k > 0) break;
		if(k > iteraciones) break;

		p.x = g_1(x_k, y_k);
		p.y = g_2(x_k, y_k);

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
