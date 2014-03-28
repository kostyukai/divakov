#include <stdio.h>
int main()
{
	int x = 1;
	int y = 0;
	printf("before y=%d\n",y);
	__asm__ __volatile__(
		"movl %1, %0\n\t"
		:"=m" (y)
		:"r" (x)
		: "memory"
	);
	printf ("after y=%d\n", y);
	return 0;
}
