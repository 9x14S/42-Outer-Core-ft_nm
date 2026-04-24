.PHONY : all re clean fclean test

TARGET  := libft_nm.a
BIN_DIR := ../bin
INC_DIR := ../include

CC      ?= /usr/bin/cc
CFLAGS  ?= -MMD -I$(INC_DIR) -Wall -Wextra -Werror -g

SRCS    := 
OBJS    := $(SRCS:.c=.o)
OBJS    := $(addprefix $(BIN_DIR)/,$(OBJS))
DEPS    := $(OBJS:.o=.d)

-include $(DEPS)
all: $(BIN_DIR) $(TARGET)

$(BIN_DIR):
	$(MKDIR_P) $@

$(BIN_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^ -c

$(TARGET): $(OBJS)
	$(AR) rcs -o $@ $^

re: fclean all
clean:
	$(RM) $(DEPS) $(OBJS)
fclean: clean
	$(RM) $(TARGET)

test: all
