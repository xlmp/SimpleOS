#Compiladores
#clang gcc
COMPILE = clang
ENVIRONMENT = WINDOWS

include make-config/tools.mk
include make-config/objetos.mk
include make-config/objetos.compile.mk

#Este Include tem configurações para carregar via linha de comando \
o QEMU, VirtualBox e o BOCH, configurações são especificas para \
cada computador.


kernel-file = .obj/simpleOS.krn
linker-file = source/linker.ld
SimpleOS-iso = .iso/SimpleOS.v001.iso

all: install $(SimpleOS-iso)
	@echo $(CCNAME)	

$(kernel-file): $(linker-file) $(CoreObjects)
	@$(LD) $(LDFLAGS) -T $< -o $@ $(CoreObjects)
	@echo -----  Kernel Compilado com Sucesso ----- 

install:  $(kernel-file) 
	@copy $(subst /,\\, $(kernel-file))  .root\\SimpleOS\\ 
	@echo ----- SimpleOS Instalado em .root com Sucesso ----- 

.PHONY: clean
clean:
	@rm -rf .obj $(SimpleOS-iso)
	@mkdir .obj
	@echo ----- Make Limpo com Sucesso ----- 

$(SimpleOS-iso):
	@echo ----- Criação do ISO ----------------
	@$(GRUB-MKIMAGEM) --prefix=.root \
	--config=.root/SimpleOS/grub/grub.cfg \
	--output=.root/SimpleOS/grub/core.img \
	-O i386-pc-eltorito biosdisk iso9660 multiboot \
	--directory=.grub-files 
	@$(MK-ISOFS) -R -b SimpleOS/grub/core.img $(MK-ISOFS-FLAGS) -o ./$@ ./.root	
	@echo ----- Aquico ISO Criado com Sucesso --

include makefile.my-pc.mk