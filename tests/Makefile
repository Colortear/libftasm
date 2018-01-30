NAME = test
LIB = -L../
SRC = ./test.c
CC = gcc -Wall -Werror -Wextra

all: $(NAME)

$(NAME):
	$(CC) $(LIB) -lfts -o $(NAME) $(SRC)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: re fclean clean all
