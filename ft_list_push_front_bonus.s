; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_list_push_front.s                               :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 02:28:17 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 02:28:19 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

            section    .text
            global    _ft_list_push_front
            extern    _malloc

_ft_list_push_front:
            push    rdi
            push    rsi
            mov        rdi, 16
            call    _malloc
            cmp        rax, 0
            jz        return
            pop        rsi
            pop        rdi
            mov        [rax], rsi
            mov        rbx, [rdi]
            mov        [rax + 8], rbx
            mov        [rdi], rax

return:
            ret
