; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_strcmp.s                                        :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/21 17:48:49 by ashea             #+#    #+#              #
; #    Updated: 2020/08/21 17:48:53 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

    section .text
    global _ft_strcmp
_ft_strcmp:
    mov rcx, 0
while:
    movsx rax, byte [rdi + rcx]
    movsx rbx, byte [rsi + rcx]
    inc rcx
    cmp rax, 0
    je end
    cmp rbx, 0
    je end
    cmp rax, rbx
    je while
end:
    cmp rax, rbx
    je equal
    cmp rax, rbx
    jg greater
    cmp rax, rbx
    jl less
equal:
    mov rax, 0
    ret
greater:
    mov rax, 1
    ret
less:
    mov rax, -1
    ret
