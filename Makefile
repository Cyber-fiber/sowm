CFLAGS  += -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS  += -Wmissing-prototypes -Wno-unused-parameter
PREFIX  ?= /usr
DESKTOP ?= $(PREFIX)/share/xsessions/
BINDIR  ?= $(PREFIX)/bin
CC      ?= gcc

all: sowm

config.h:
	cp config.def.h config.h

sowm: sowm.c sowm.h config.h Makefile
	$(CC) -O3 $(CFLAGS) -o $@ $< -lX11 $(LDFLAGS)

sowm.desktop:
    install -Dm644 sowm.desktop $(DESKTOP)/sowm.desktop

install: all
	install -Dm755 sowm $(DESTDIR)$(BINDIR)/sowm

uninstall:
	rm -f $(DESTDIR)/sowm
	rm -f $(DESKTOP)/sowm.desktop

clean:
	rm -f sowm *.o

.PHONY: all install sowm.desktop uninstall clean
