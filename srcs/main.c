#include "libasm.h"

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static void test_strlen(void)
{
	const char *s = "Hello libasm";
	size_t len = ft_strlen(s);

	printf("[strlen] '%s' -> %zu (expected %zu)\n", s, len, strlen(s));
}

static void test_strcpy(void)
{
	char dst[64] = {0};
	char *res = ft_strcpy(dst, "copilot");

	printf("[strcpy] result='%s'\n", dst);
	if (res != dst)
		printf("[strcpy] unexpected return pointer\n");
}

static void test_strcmp(void)
{
	int eq = ft_strcmp("abc", "abc");
	int less = ft_strcmp("abc", "abd");
	int greater = ft_strcmp("abd", "abc");

	printf("[strcmp] eq=%d less=%d greater=%d\n", eq, less, greater);
}

static void test_write(void)
{
	const char *msg = "write test via ft_write\n";
	ssize_t written = ft_write(STDOUT_FILENO, msg, strlen(msg));

	printf("[write] wrote %zd bytes\n", written);
}

static void test_read(void)
{
	const char *path = "tmp_libasm_test.txt";
	const char *content = "libasm-read";
	char buf[64] = {0};
	int fd;
	ssize_t nread;

	fd = open(path, O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd < 0)
	{
		perror("open for write");
		return;
	}
	if (write(fd, content, strlen(content)) < 0)
	{
		perror("write");
		close(fd);
		return;
	}
	close(fd);

	fd = open(path, O_RDONLY);
	if (fd < 0)
	{
		perror("open for read");
		return;
	}
	nread = ft_read(fd, buf, sizeof(buf) - 1);
	if (nread >= 0)
		printf("[read] read %zd bytes: '%s'\n", nread, buf);
	else
		perror("ft_read");
	close(fd);
	unlink(path);
}

static void test_strdup(void)
{
	char *dup = ft_strdup("dup me");

	if (dup)
	{
		printf("[strdup] '%s'\n", dup);
		free(dup);
	}
	else
		printf("[strdup] allocation failed\n");
}

static void test_atoi_base(void)
{
	printf("[atoi_base] 137(base10) -> %d\n", ft_atoi_base("137", "0123456789"));
	printf("[atoi_base] ff(base16) -> %d\n", ft_atoi_base("ff", "0123456789abcdef"));
	printf("[atoi_base] -1010(base2) -> %d\n", ft_atoi_base("-1010", "01"));
	printf("[atoi_base] invalid base -> %d\n", ft_atoi_base("10", "011"));
}

int main(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
	test_atoi_base();
	return 0;
}
