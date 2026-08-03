NAME = libasm.a

NASM = nasm
NASM_FLAGS = -f elf64

SRCS = \
	srcs/ft_strlen.s \
	srcs/ft_strcpy.s \
	srcs/ft_strcmp.s \
	srcs/ft_write.s \
	srcs/ft_read.s \
	srcs/ft_strdup.s \
	srcs/ft_atoi_base.s

OBJS = $(SRCS:.s=.o)

TEST_BIN = asm_test
TEST_SRC = srcs/main.c

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

srcs/%.o: srcs/%.s
	$(NASM) $(NASM_FLAGS) $< -o $@

$(TEST_BIN): $(NAME) $(TEST_SRC)
	gcc $(TEST_SRC) $(NAME) -Iincs -o $(TEST_BIN)

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re test