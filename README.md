# libasm

Assembly implementation of common C library functions in **x86_64 NASM**.

## Overview

This project builds a static library, `libasm.a`, with handwritten assembly implementations of:

- `ft_strlen`
- `ft_strcpy`
- `ft_strcmp`
- `ft_write`
- `ft_read`
- `ft_strdup`
- `ft_atoi_base`

A small C test program is provided to quickly verify behavior.

## Requirements

- Linux (ELF64 target)
- `nasm`
- `gcc`
- `make`

## Build

```bash
make
```

This creates `libasm.a`.

## Run tests

```bash
make test
```

This builds and runs `asm_test` (`srcs/main.c`) against the library.

## Clean artifacts

```bash
make clean   # remove object files
make fclean  # remove objects + libasm.a + asm_test
make re      # full rebuild
```

## Repository layout

```text
incs/libasm.h      Public function prototypes
srcs/*.s           Assembly implementations
srcs/main.c        Basic test binary source
Makefile           Build/test targets
```

## Notes

- `ft_write` and `ft_read` mirror libc behavior and return `ssize_t`.
- Additional list-related assembly sources are present in `srcs/` but are not part of the default `Makefile` build targets.
