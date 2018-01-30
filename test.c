#include <stdio.h>
#include <stdlib.h>
#include "include/libfts.h"

int		main(void)
{
	char	*c;

	c = (char *)malloc(sizeof(char) * 15);
	ft_bzero(c, 15);
	c[0] = 'C';
	c[0] = ft_tolower(c[0]);
	c[1] = 'b';
	c[1] = ft_toupper(c[1]);
	c[2] = 0;
	printf("%s\n", c);
	return (0);
}
