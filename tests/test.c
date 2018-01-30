#include <stdio.h>

extern int	ft_tolower(int c);

int			main(void)
{
	int		c = 'B';

	c = ft_tolower(c);
	printf("%c\n", c);
	return (0);
}
