; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_strdup.s                                        :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 00:10:29 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 00:10:32 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

section .text
    global _ft_strdup
    extern _malloc
    extern _ft_strlen
    extern _ft_strcpy
_ft_strdup:
    push rdi
    call _ft_strlen
    mov rdi, rax
    inc rdi
    call _malloc
    cmp rax, 0
    je end
    mov rdi, rax
    pop rsi
    call _ft_strcpy
end:
    ret
