#include <types.hpp>
extern "C" {
    #include <kernel.h>
}

char *module_start;
unsigned int module_end;

extern "C" void kmain(struct multiboot_info *boot_info){
    
    _kclear();
    _kcolor(BRIGHT_GREEN);
    _kputs(DREAMOS_VER);
    _kcolor(WHITE);

    syscall_init();
    module_start = (char*) *((unsigned int*)boot_info->mods_addr);
	module_end = *((unsigned int*)(boot_info->mods_addr+4));

    //printf("SimpleOS - Iniciado com Sucesso!");
}

typedef void (*constructor)();
extern "C" constructor start_ctors;
extern "C" constructor end_ctors;
extern "C" void callConstructors()
{
    for(constructor* i = &start_ctors; i != &end_ctors; i++)
        (*i)();
}
