#include <stdio.h>
#include <stdlib.h>
#include "include/libfts.h"

int		main(void)
{
	char	*c;
	char	d[7] = "123456\0";

	c = (char *)malloc(sizeof(char) * 15);
	ft_bzero(c, 15);
	c[0] = 'C';
	c[0] = ft_tolower(c[0]);
	c[1] = 'b';
	c[1] = ft_toupper(c[1]);
	c[2] = 0;
	c = ft_strcat(c, d);
	if (!ft_isdigit(c[1]))
		printf("isdigit\n");
	if (ft_isdigit(c[3]))
		printf("isnotdigit\n");
	if (ft_isalpha(c[1]))
		printf("isalpha\n");
	if (!ft_isalpha(c[3]))
		printf("isnotalpha\n");
	printf("%s\n", c);
	return (0);
}
