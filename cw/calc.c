#include <stdio.h>
int main()
{
	char c; int a,b,r;
	c=getchar();
	scanf("%d",&a);
	scanf("%d", &b);
	switch (c)
	{
	case '+':
	{
		r = exsumm(a,b);
		break;
	}
	case '-':
	{
		//r = exsub(a,b);
		break;
	}
	case '/': 
	{
		//r = exdiv(a,b);
		break;
	}
	case '*':
	{
		//r = exmul(a,b);
		break;
	}
	case 'd':
	{
		//r = exdec(a);
		break;
	}
	case 'i':
	{
		//r = exinc(a);
		break;
	}
	}
	printf (" the result of my external function is %d",r);
	return 0;
}
