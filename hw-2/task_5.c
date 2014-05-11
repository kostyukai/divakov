#include <stdio.h>

int intsumm(int *ia, int n);
float flsumm(float *fa, int n); 
int main()
{
	int i;
	int n = 5;
	int *ia = (int *)malloc(n*sizeof(int));
	float *fa = (float *)malloc(n*sizeof(float));
	for (i=0; i<5; i++)
	scanf("%d", &ia[i]);
	printf("%d\n", intsumm(ia, n));
	for (i=0; i<5; i++)
	scanf("%f", &fa[i]);
	printf("%f\n", flsumm(fa, n));
	
	return 0;
}
