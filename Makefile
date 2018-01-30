NAME = libfts.a
SRC = src/ft_tolower.s
OBJECTS = src/ft_tolower.o
CC = nasm -f elf64
RM = rm -rf

all: $(NAME)

$(NAME):
	$(CC) $(SRC) -o $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)
	ranlib $(NAME)

clean:
	$(RM) $(OBJECTS)

fclean : clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all re fclean clean
