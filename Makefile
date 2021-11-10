# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/27 00:16:43 by ashea             #+#    #+#              #
#    Updated: 2020/08/27 00:16:57 by ashea            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

SRC		=	ft_strlen.s \
			ft_strcmp.s \
			ft_strcpy.s \
			ft_strdup.s \
			ft_write.s \
			ft_read.s

SRC_BONUS	=	ft_list_size_bonus.s \
			ft_list_push_front_bonus.s \
			ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s

OBJ		=	$(SRC:.s=.o)
OBJ_BONUS	=	$(SRC_BONUS:.s=.o)

NASM		=	nasm
NASM_FLAGS	=	-f macho64

TEST		=	test
GCC_FLAGS 	=	-Wall -Werror -Wextra

%.o:			%.s
			$(NASM) $(NASM_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJ)
			ar rcs $(NAME) $(OBJ)

clean:
			rm -rf $(OBJ) $(OBJ_BONUS)

fclean:			clean
			rm -rf $(NAME) $(TEST)

re:			fclean $(NAME)


bonus:			$(OBJ) $(OBJ_BONUS)
			ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)

test:			$(NAME) bonus
			gcc $(GCC_FLAGS) -L. -lasm -o $(TEST) main.c
			./$(TEST)

.PHONY:			all clean fclean re bonus test
