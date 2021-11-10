/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ashea <ashea@student.21-school.ru>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/21 17:29:10 by ashea             #+#    #+#             */
/*   Updated: 2020/08/21 17:33:44 by ashea            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void test_strlen()
{
	printf("=============ft_strlen=============\n");
    printf("        strlen  vc  ft_strlen      \n");
	printf("%-15s:%8zu%8zu\n", "\"\"", strlen(""), ft_strlen(""));
    printf("%-15s:%8zu%8zu\n", "\"hello, world!\"", strlen("hello, world!"), ft_strlen("hello, world!"));
}

void test_strcmp()
{
    printf("=============ft_strcmp=============\n");
    printf("        strcmp  vc  ft_strcmp      \n");
    printf("%-15s:%8d%8d\n", "\"\", \"\"", strcmp("", ""), ft_strcmp("", ""));
    printf("%-15s:%8d%8d\n", "\"\", \"a\"", strcmp("", "a"), ft_strcmp("", "a"));
    printf("%-15s:%8d%8d\n", "\"a\", \"\"", strcmp("a", ""), ft_strcmp("a", ""));
    printf("%-15s:%8d%8d\n", "\"adc\", \"a\"", strcmp("afc", "a"), ft_strcmp("afc", "a"));
    printf("%-15s:%8d%8d\n", "\"a\", \"adc\"", strcmp("a", "afc"), ft_strcmp("a", "afc"));
    printf("%-15s:%8d%8d\n", "\"adc\", \"adc\"", strcmp("afc", "afc"), ft_strcmp("afc", "afc"));
    printf("%-15s:%8d%8d\n", "\"adc\", \"ABC\"", strcmp("abc", "ABC"), ft_strcmp("abc", "ABC"));
}

void test_strcpy()
{
    char dst[15];
    char dst2[15];
    printf("=============ft_strcpy=============\n");
    printf("        strcpy  vc  ft_strcpy      \n");
    printf("%-25s:|%15s|%15s|\n", "dst = \"\"", strcpy(dst, ""), ft_strcpy(dst2, ""));
    printf("%-25s:|%15s|%15s|\n", "dst = \"hello, world!\"", strcpy(dst, "hello, world!"), ft_strcpy(dst2, "hello, world!"));
    printf("%-25s:|%15s|%15s|\n", "dst = \"123\\045\"", strcpy(dst, "123\045"), ft_strcpy(dst2, "123\045"));
    dst[4] = '!';
    dst2[4] = '!';
    printf("%-25s:|%15s|%15s|\n", "dst[4] = \'!\'", dst, dst2);
}

void test_strdup()
{
    printf("=============ft_strdup=============\n");
    printf("        strdup  vc  ft_strdup      \n");
    printf("%-25s:|%15s|%15s|\n", "\"\"", strdup(""), ft_strdup(""));
    printf("%-25s:|%15s|%15s|\n", "\"hello, world!\"", strdup("hello, world!"), ft_strdup("hello, world!"));
    printf("%-25s:|%15s|%15s|\n", "\"hello,\\0world!\"", strdup("hello,\0world!"), ft_strdup("hello,\0world!"));
}

void test_write()
{
    printf("=============ft_write==============\n");
    printf("         write  vc  ft_write       \n");
    write(1, "|1| ", 4);
    ft_write(1, "|1| ", 4);
    printf("\n");
    char dest[15] = "Hello, world! ";
    write(1, dest, strlen(dest));
    ft_write(1, dest, strlen(dest));
    printf("\n");
    write(2, dest, strlen(dest));
    ft_write(2, dest, strlen(dest));
    printf("\n");
    write(0, dest, strlen(dest));
    ft_write(0, dest, strlen(dest));
    printf("\n");
    write(-3, dest, strlen(dest));
    printf("errno = %d ", errno);
    ft_write(-3, dest, strlen(dest));
    printf("errno = %d\n", errno);
}

void test_read()
{
    char *dst;
    char *dst2;
    int d;
    int d2;
    dst = calloc(15, sizeof(char));
    dst2 = calloc(15, sizeof(char));
    printf("==============ft_read==============\n");
    printf("          read  vc  ft_read        \n");
    errno = 0;
    d = read(1, dst, 10);
    printf("%sd = %d errno = %d\n", dst, d, errno);
    errno = 0;
    d2 = ft_read(1, dst2, 10);
    printf("%sd2 = %d errno = %d\n", dst2, d2, errno);
    errno = 0;
    d = read(1, dst, 0);
    printf("%sd = %d errno = %d\n", dst, d, errno);
    errno = 0;
    d2 = ft_read(1, dst2, 0);
    printf("%sd2 = %d errno = %d\n", dst2, d2, errno);
    d = read(1, dst, 2);
    printf("%sd = %d errno = %d\n", dst, d, errno);
    errno = 0;
    d2 = ft_read(1, dst2, 2);
    printf("%sd2 = %d errno = %d\n", dst2, d2, errno);
    d = read(0, dst, 20);
    printf("%sd = %d errno = %d\n", dst, d, errno);
    errno = 0;
    d2 = ft_read(0, dst2, 20);
    printf("%sd2 = %d errno = %d\n", dst2, d2, errno);
    d = read(-1, dst, 20);
    printf("%sd = %d errno = %d\n", dst, d, errno);
    errno = 0;
    d2 = ft_read(-1, dst2, 20);
    printf("%sd2 = %d errno = %d\n", dst2, d2, errno);
}

void ft_printf_list(t_list *list)
{
    printf("list: ");
    while (list)
    {
        printf("%s ", (char *)list->data);
        list = list->next;
    }
    printf("\n");
}

void test_list_size()
{
    t_list *list = NULL;
    printf("============ft_list_size============\n");
    ft_printf_list(list);
    printf("list_size = %zu\n", ft_list_size(list));
    ft_list_push_front(&list, "1");
    ft_printf_list(list);
    printf("list_size = %zu\n", ft_list_size(list));
    ft_list_push_front(&list, "2");
    ft_printf_list(list);
    printf("list_size = %zu\n", ft_list_size(list));
    ft_list_push_front(&list, "3");
    ft_printf_list(list);
    printf("list_size = %zu\n", ft_list_size(list));

}

void test_list_push_front()
{
    t_list *list = NULL;
    printf("==========ft_list_push_front=========\n");
    ft_list_push_front(&list, "1");
    ft_printf_list(list);
    ft_list_push_front(&list, "2");
    ft_printf_list(list);
    ft_list_push_front(&list, "3");
    ft_printf_list(list);
}

int cmp(char *a, char *b)
{
    if (a[0] > b[0])
        return (1);
    return (0);
}

void test_list_sort()
{
    t_list *list = NULL;
    printf("=============ft_list_sort============\n");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "3");
    ft_printf_list(list);
    
    ft_list_sort(&list, &cmp);
    ft_printf_list(list);
}

int cmp_ref(char *data, char *data_ref)
{
    if (data[0] == data_ref[0])
        return (0);
    return (1);
}

void test_list_remove_if()
{
    t_list *list = NULL;
    void *data_ref;
    data_ref = strdup("3");
    printf("==========ft_list_remove_if==========\n");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "3");
    
    ft_printf_list(list);
    ft_list_remove_if(&list, data_ref, &cmp_ref);
    ft_printf_list(list);
}

int main(void)
{
	test_strlen();
    test_strcmp();
    test_strcpy();
    test_strdup();
    test_write();
    //test_read();
    test_list_push_front();
    test_list_size();
    test_list_sort();
    test_list_remove_if();
	return (0);
}
