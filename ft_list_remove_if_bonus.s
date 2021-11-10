; # **************************************************************************** #
; #                                                                              #
; #                                                         :::      ::::::::    #
; #    ft_list_remove_if                                  :+:      :+:    :+:    #
; #                                                     +:+ +:+         +:+      #
; #    By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+         #
; #                                                 +#+#+#+#+#+   +#+            #
; #    Created: 2020/08/22 18:36:59 by ashea             #+#    #+#              #
; #    Updated: 2020/08/22 18:37:01 by ashea            ###   ########.fr        #
; #                                                                              #
; # **************************************************************************** #

                section    .text
                global     _ft_list_remove_if
                extern     _free
                    
_ft_list_remove_if:
                push       rbp
                mov        rbp, rsp
                mov        r12, rdi
                mov        r13, rsi
                mov        r14, rdx
                cmp        r12, 0
                je         end
                mov        r15, [r12]
                cmp        r15, 0
                je         end

while:
                cmp        r15, 0
                je         end
                mov        rdi, [r15]
                mov        rsi, r13
                call       r14
                cmp        rax, 0
                jne        while2
                mov        r15, [r12]
                mov        r10, [r15 + 8]
                mov        [r12], r10
                mov        rdi, r15
                call       _free
                mov        r15, [r12]
                jmp        while

while2:
                mov        r10, [r15 + 8]
                cmp        r15, 0
                je         end
                cmp        r10, 0
                je         end
                mov        rdi, [r10]
                mov        rsi, r13
                call       r14
                cmp        rax, 0
                jne        next_step
                mov        rdi, r10
                mov        r10, [r10 + 8]
                mov        [r15 + 8], r10
                call       _free
                jmp        while2

next_step:
                mov        r15, r10
                jmp        while2

end:
                pop        rbp
                ret
