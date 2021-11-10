; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_write.s                                         :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 01:00:07 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 01:00:11 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

    section .text
    global _ft_write
    extern ___error

_ft_write:
    mov rax, 0x02000004
    syscall
    jc error 
    ret

error:
    mov rdx, rax
    push rdx
    call ___error
    pop rdx
    mov [rax], rdx
    mov rax, -1
    ret
