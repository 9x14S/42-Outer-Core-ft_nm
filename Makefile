.PHONY : all re clean fclean test

LIB_DIR  := lib
LIB      := $(LIB_DIR)/libft_nm.a
OBJ_DIR  := obj
INC_DIR  := include

TARGET   := ft_nm

CC       ?= /usr/bin/cc
CFLAGS   ?= -MMD -I$(INC_DIR) -Wall -Wextra -Werror -g

SRCS     := ft_nm.c
OBJS     := $(SRCS:.c=.o)
OBJS     := $(addprefix $(OBJ_DIR)/,$(OBJS))
DEPS     := $(OBJS:.o=.d)

-include $(DEPS)
all: $(OBJ_DIR) $(TARGET)

$(OBJ_DIR):
	mkdir -p $@

$(TARGET): $(LIB) $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^ -c

$(LIB):
	$(MAKE) -C $(LIB_DIR)

re: fclean all
clean:
	$(RM) $(DEPS) $(OBJS)
fclean: clean
	$(RM) $(TARGET)

test: all
