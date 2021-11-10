; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_list_size.s                                     :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 01:46:18 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 01:46:20 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

            section    .text
            global    _ft_list_size

_ft_list_size:
            mov        rsi, rdi
            mov        rax, 0
            jmp        while

while:
            cmp        rdi, 0
            jz         end
            mov        rdi, [rdi + 8]
            inc        rax
            jmp        while

end:
            mov        rdi, rsi
            ret
