# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bibrahim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/20 16:16:57 by bibrahim          #+#    #+#              #
#    Updated: 2022/01/20 16:17:11 by bibrahim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME1 = server

NAME2 = client

NAME3 = server_bonus

NAME4 = client_bonus

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SOURCE = Minitalk_utils.c 

OBJ = $(SOURCE:.c=.o)

DEFS = minitalk.h

all: $(NAME1) $(NAME2)

$(NAME1) : server.c  $(DEFS)
	$(CC) $(CFLAGS) server.c $(SOURCE) -o server
$(NAME2) : client.c $(DEFS)
	$(CC) $(CFLAGS) client.c $(SOURCE) -o client

bonus: $(NAME3) $(NAME4)
$(NAME3) : server_bonus.c $(DEFS)
	$(CC) $(CFLAGS) server_bonus.c $(SOURCE) -o server_bonus
$(NAME4) : client_bonus.c $(DEFS)
	$(CC) $(CFLAGS) client_bonus.c $(SOURCE) -o client_bonus
	
clean:
	@rm -rf $(OBJ)
fclean: clean
	@rm -rf $(NAME1) $(NAME2) $(NAME3) $(NAME4)

re: fclean all bonus
