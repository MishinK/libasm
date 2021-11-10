; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_strlen.s                                        :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/21 17:36:40 by ashea             #+#    #+#              #
; #    Updated: 2020/08/21 17:36:44 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

section .text
	global _ft_strlen
_ft_strlen:
    mov rax, 0
while:
    cmp byte [rdi + rax], 0
    je endwhile
    inc rax
    jmp while
endwhile:
    ret 
