# Makefile for symlinks
CC     := gcc
CFLAGS += $(shell getconf LFS_CFLAGS 2>/dev/null)
OWNER   = root
GROUP   = root
MANDIR  = /usr/man/man8/symlinks.8
BINDIR  = /usr/local/bin
INSTALL ?= install

.PHONY: all
all: symlinks

symlinks: symlinks.c
	$(CC) -Wall -Wstrict-prototypes -O2 $(CFLAGS) -o symlinks symlinks.c

install: all symlinks.8
	$(INSTALL) -c -o $(OWNER) -g $(GROUP) -m 755 symlinks $(BINDIR)

.PHONY: clean
clean:
	rm -f symlinks *.o core
