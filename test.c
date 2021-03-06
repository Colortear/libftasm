#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include "include/libfts.h"

int		main(void)
{
	int		fd;
	char	*c;
	char	d[7] = "123456\0";
	char	e[15];
	char	*ptr;

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
	if (!ft_isprint(c[9]))
		printf("not printable\n");
	if (ft_isprint(c[2]))
		printf("isprintable\n");
	if (!ft_isascii(-12) && !ft_isascii(130))
		printf("Not ascii\n");
	if (ft_isascii(48))
		printf("Is ascii\n");
	if (!ft_isalnum(')') && !ft_isalnum(';') && !ft_isalnum(']')
			&& !ft_isalnum('~'))
		printf("not al or num\n");
	if (ft_isalnum('7') && ft_isalnum('c') && ft_isalnum('H'))
		printf("all are num or al\n");
	printf("ft_strlen: %zu\n", ft_strlen(c));
	ft_puts(c);
	c = ft_memset(c, ']', 4);
	printf("c is %s after memset\n", c);
	ptr = ft_memcpy(e, c, 9);
	printf("memcpy e: %s\nmemcpy return: %s\n", e, ptr);
	printf("c is still: %s\n", c);
	free(c);
	c = ft_strdup("HERRO FREIND");
	ft_puts(c);
	fd = open("Makefile", O_RDONLY);
	ft_cat(fd);
	close(fd);
	return (0);
}
