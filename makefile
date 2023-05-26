#Compiladores
#clang gcc
COMPILE = clang
ENVIRONMENT = WINDOWS

include make-config/tools.mk
include make-config/objetos.mk

kernel-file = .obj/simpleOS.krn
linker-file = source/linker.ld
SimpleOS-iso = .iso/SimpleOS.v001.iso

all: install $(SimpleOS-iso)
	@echo $(CCNAME)

$(kernel-file): $(linker-file) $(kernel-objects)
#	@$(LD) $(LDFLAGS) -T $< -o $@ $(CoreObjects)
	@echo "Kernel Compilado com Sucesso"

install:  $(kernel-file) 

$(SimpleOS-iso):
	@echo "Aquico ISO Criado com Sucesso"

