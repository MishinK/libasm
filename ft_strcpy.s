; /* ************************************************************************** */
; /*                                                                            */
; /*                                                        :::      ::::::::   */
; /*   ft_strcpy.c                                        :+:      :+:    :+:   */
; /*                                                    +:+ +:+         +:+     */
; /*   By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+        */
; /*                                                +#+#+#+#+#+   +#+           */
; /*   Created: 2020/08/21 23:33:00 by ashea             #+#    #+#             */
; /*   Updated: 2020/08/21 23:33:10 by ashea            ###   ########.fr       */
; /*                                                                            */
; /* ************************************************************************** */

    section .text
    global _ft_strcpy
_ft_strcpy:
    mov rcx, 0
while:
    mov bh, byte [rsi + rcx]
    cmp bh, 0
    je end
    mov byte [rdi + rcx], bh
    inc rcx
    jmp while
end:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    ret
