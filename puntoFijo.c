#include <stdio.h>
#include <stdlib.h>
#include <math.h> 

long double g_1(long double x, long double y)
{
	long double _x = ((x * x) - y + 0.5)/2

	return _x;	
}

long double g_2(long double x, long double y)
{	
	long double _y = (-(x * x) - (4 * (y * y)) + (8 * y) + 4)/(8) 

	return _y;
}


int main()
{
	return 0;
}
