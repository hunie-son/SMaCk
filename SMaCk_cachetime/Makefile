CC                   = gcc
AS                   = gcc
LD                   = gcc
CFLAGS              += -D_GNU_SOURCE -O0 
INCLUDE              = -I.
LDFLAGS             += $(SUBDIRS:%=-L %) -lpapi

SOURCES              = $(shell ls *.c)
OBJECTS              = $(SOURCES:.c=.o)  asm.o
OUTPUT               = smack_cachetime

BUILDDIRS            = $(SUBDIRS:%=build-%)
CLEANDIRS            = $(SUBDIRS:%=clean-%)

.SILENT:
all: $(OUTPUT)

$(OUTPUT): $(BUILDDIRS) $(OBJECTS)
	echo "$(INDENT)[LD]" $(OBJECTS) $(LIBS) -o $(OUTPUT) 
	$(LD) $(OBJECTS) $(LDFLAGS) -o $(OUTPUT)  -no-pie

%.o : %.c
	echo "$(INDENT)[CC] " $<
	$(CC) $(CFLAGS) $(INCLUDE) -c $< 

%.o : %.S
	echo "$(INDENT)[AS] " $<
	$(AS) $(INCLUDE) -c $< -o $@

clean: $(CLEANDIRS)
	echo "$(INDENT)[RM]" $(OBJECTS) $(OUTPUT)
	rm -f $(OBJECTS) $(OUTPUT)

$(BUILDDIRS):
	echo "$(INDENT)[===] $(@:build-%=%) [===]"
	$(MAKE) -C $(@:build-%=%) INDENT+="$(INDENT_STEP)" curr-dir=$(curr-dir)/$(@:build-%=%)

$(CLEANDIRS):
	echo "$(INDENT)[===] $(@:clean-%=%) [===]"
	$(MAKE) clean -C $(@:clean-%=%) INDENT+="$(INDENT_STEP)" curr-dir=$(curr-dir)/$(@:build-%=%)
