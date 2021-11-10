; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_read.s                                          :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 01:15:32 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 01:15:33 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

    section .text
    global _ft_read
    extern ___error

_ft_read:
    mov rax, 0x02000003
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
