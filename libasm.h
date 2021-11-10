/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/21 17:25:36 by ashea             #+#    #+#             */
/*   Updated: 2020/08/21 17:28:53 by ashea            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

size_t	    ft_strlen(const char *str);
char        *ft_strcpy(char *dst, const char *src);
char        *ft_strdup(const char *s1);
int        ft_strcmp(const char *s1, const char *s2);
ssize_t    ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t    ft_read(int fildes, void *buf, size_t nbyte);

size_t     ft_list_size(t_list *list);
void       ft_list_push_front(t_list **list, void *data);
void       ft_list_sort(t_list **list, int (*cmp)());
void       ft_list_remove_if(t_list **list, void *data_ref, int (*cmp)());

#endif

