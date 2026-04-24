.PHONY : all re clean fclean test

LIB_DIR  := lib
LIB      := $(LIB_DIR)/libft_nm.a
BIN_DIR  := bin
INC_DIR  := include

TARGET   := $(BIN_DIR)/ft_nm

CC       ?= /usr/bin/cc
CFLAGS   ?= -MMD -I$(INC_DIR) -Wall -Wextra -Werror -g

SRCS     := ft_nm.c
OBJS     := $(SRCS:.c=.o)
OBJS     := $(addprefix $(BIN_DIR)/,$(OBJS))
DEPS     := $(OBJS:.o=.d)

-include $(DEPS)
all: $(BIN_DIR) $(TARGET)

$(BIN_DIR):
	$(MKDIR_P)

$(TARGET): $(LIB) $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIN_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^ -c

$(LIB):
	$(MAKE) -C $(LIB_DIR)

re: fclean all
clean:
	$(RM) $(DEPS) $(OBJS)
fclean: clean
	$(RM) $(TARGET)

test: all
