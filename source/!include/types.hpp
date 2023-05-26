#ifndef _TYPES_HPP_
#define _TYPES_HPP_


//Single Types
typedef unsigned    Uns;
typedef void        Sub;
typedef void*       Obj;
typedef const void*       CObj;
typedef int         Chk;
typedef unsigned long    ulong;

#define OK          0
#define FAIL        -1
#define To(_TYPE_)       (_TYPE_)

#define NULL        0
#define Logic       bool
#define CChar       const char
#define uChar       unsigned char
#define uCChar      unsigned const char
#define uShort      unsigned short
#define NNatural    unsigned int
#define NInteger    int
#define NLong       long int
#define Object      void**
#define VarBinary   char* 
typedef unsigned    size_t;
typedef unsigned char *va_list;


// Tipos inteiros sem sinal
typedef unsigned char           uint8_t;
typedef unsigned char           uchar;
typedef unsigned short int      uint16_t;
typedef unsigned int            uint32_t;
typedef unsigned long long int  uint64_t;

// Tipos inteiros com sinal
typedef char                    int8_t;
typedef short int               int16_t;
typedef int                     int32_t;
typedef long long int           int64_t;

// Tipos para ponteiros
typedef int             intptr_t;
typedef unsigned        uintptr_t;

#define __bool_true_false_are_defined   1

#ifndef __cplusplus

#define false   0
#define true    1

#define bool    _Bool

#if __STDC_VERSION__ < 199901L && __GNUC__ < 3
typedef int     _Bool;
#endif

#endif

#define TWaitFilaDef    TWaitFila

#define _string		char*
#define c_string    const char *
#define Lit         (_string)


#define dtNumer     unsigned short
struct struct_date
{
    uint32_t Year;
    dtNumer Month;
    dtNumer Day;
    dtNumer Hour;
    dtNumer Minute;
    dtNumer Second;
    /**Byte year[4];
    Byte month[2];
    Byte day[2];
    Byte hour[2];
    Byte minute[2];
    Byte second[2];
    */
    uChar hundredth[2];
    uChar offset;
} __attribute__ ((packed));
#define Date	struct struct_date

#endif //_TYPES_HPP_