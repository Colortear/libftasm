NAME = libfts.a
TEST = test
CC = gcc
INC = -I include
LIB = -L . -lfts
CFLAGS = -Wall -Werror -Wextra
NASM = nasm

NASMFLAGS = -f elf64

SRCS = ft_tolower.s ft_toupper.s ft_bzero.s ft_strcat.s ft_isdigit.s \
	   ft_isalpha.s

SRC = $(addprefix src/, $(SRCS))
OBJ = $(SRC:src/%.s=%.o)
O_DIRS = $(SRC:src/%.s=src/%.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	mv $(OBJ) src
	ranlib $(NAME)

%.o: src/%.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	$(RM) $(O_DIRS)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(TEST)

test:
	$(CC) test.c $(CFLAGS) $(INC) -L. -lfts -o $(TEST)

re: fclean all

.PHONY: re all clean fclean
