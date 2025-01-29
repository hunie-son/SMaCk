CC       = gcc
LD       = gcc
AS       = gcc  

CFLAGS   = -O2 -g -D_GNU_SOURCE -Wall -Wextra -std=gnu99 -fPIC
INCLUDE  = -I.
LDFLAGS  = -lpthread -no-pie
SOURCES  = main.c #l1i.c
ASM_SOURCES = asm.S

OBJECTS  = $(SOURCES:.c=.o) $(ASM_SOURCES:.S=.o)

OUTPUT   = mastik_cachetime
all: $(OUTPUT)
$(OUTPUT): $(OBJECTS)
	@echo "[LD] $@"
	$(LD) $(OBJECTS) $(LDFLAGS) -o $(OUTPUT)

%.o : %.c
	@echo "[CC] $<"
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

%.o : %.S
	@echo "[AS] $<"
	$(AS) $(CFLAGS) -c $< -o $@

clean:
	@echo "[RM] $(OBJECTS) $(OUTPUT)"
	rm -f $(OBJECTS) $(OUTPUT)

