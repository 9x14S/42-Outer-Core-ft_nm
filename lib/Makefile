.PHONY : all re clean fclean test

TARGET  := libft_nm.a
OBJ_DIR := ../obj
INC_DIR := ../include

CC      ?= /usr/bin/cc
CFLAGS  ?= -MMD -I$(INC_DIR) -Wall -Wextra -Werror -g

SRCS    := 
OBJS    := $(SRCS:.c=.o)
OBJS    := $(addprefix $(OBJ_DIR)/,$(OBJS))
DEPS    := $(OBJS:.o=.d)

-include $(DEPS)
all: $(OBJ_DIR) $(TARGET)

$(OBJ_DIR):
	$(MKDIR_P) $@

$(OBJ_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^ -c

$(TARGET): $(OBJS)
	$(AR) rcs -o $@ $^

re: fclean all
clean:
	$(RM) $(DEPS) $(OBJS)
fclean: clean
	$(RM) $(TARGET)

test: all
