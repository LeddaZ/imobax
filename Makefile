VERSION = 1.0.1
TARGET  = imobax
SRCDIR  = src
UNAME  := $(shell uname)
LIBS    = -lsqlite3
ifneq ($(UNAME),Darwin)
LIBS   += -lcrypto
endif
FLAGS  ?= -Wall -O3 -DVERSION=$(VERSION) -DTIMESTAMP="`date +'%d. %B %Y %H:%M:%S'`" -flto $(LIBS) $(CFLAGS)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRCDIR)/*.c
	$(CC) -o $@ $^ $(FLAGS)

clean:
	rm -f $(TARGET)
