; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_list_sort.s                                     :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 18:36:59 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 18:37:01 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

            section     .text
            global      _ft_list_sort

_ft_list_sort:
            mov         r12, [rdi]
            cmp         r12, 0
            je          end
            mov         r14, rsi

while_first:
            mov         r13, [r12+8]
            cmp         r13, 0
            je          end

while_second:
            push        rdi
            push        rsi
            mov         rdi, [r12]
            mov         rsi, [r13]
            call        r14
            cmp         rax, 0
            jne         swap

while_second_dop:
            pop         rsi
            pop         rdi
            mov         r13, [r13+8]
            cmp         r13, 0
            jne         while_second
            mov         r12, [r12+8]
            cmp         r12, 0
            jne         while_first

end:
            ret
swap:
            mov         [r12], rsi
            mov         [r13], rdi
            jmp         while_second_dop
