INCLUDEDIR = source/!include

ifeq ($(COMPILE),clang)
CC := clang 
CCNAME := Usando Compilador LLVM
CCPARAMS := -m32 -I$(INCLUDEDIR) -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -Wno-write-strings \
-fpermissive \
-march=i386 --target=i386-pc-none-elf -ffreestanding \
-fasm-blocks -std=c++14 \
-nostdlib -nostdinc 
AS = clang 
ASPARAMS = -m32 -march=i386 --target=i386-pc-none-elf -ffreestanding

LD:=i686-elf-ld 
#lld.ld

#-----------------------------------------
else 
CC := i686-elf-gcc
CCNAME := Usando Compilador GCC

CCPARAMS := -m32 -I$(INCLUDEDIR) -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -Wno-write-strings \
-fpermissive \
-march=i386 --target=i386-pc-none-elf -ffreestanding \
-fasm-blocks -std=c++14
AS = i686-elf-gcc 
ASPARAMS = -m32 -march=i386 --target=i386-pc-none-elf -ffreestanding
LD:= i686-elf-ld

endif

ifeq ($(ENVIRONMENT),WINDOWS)
cp = copy 
OSMSG = Compilando em Ambiente WINDOWS
GRUB-MKIMAGEM := grub-mkimage.exe
MK-ISOFS := mkisofs
MK-ISOFS-FLAGS :=  -no-emul-boot -boot-load-size 12 -boot-info-table

else
cp = cp
OSMSG = Compilando em Ambiente Não WINDOWS

endif
