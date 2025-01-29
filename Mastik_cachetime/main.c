/*
 * Mastik Toolkit cache time anaylsis (baseline comparison)
 *
 * 
 * authors: 
 * Seonghun Son <seonghun@iastate.edu>
 * Daniel Moghimi <danielmm@googl.com>
 * Berk Gulmezoglu <bgulmez@iastate.edu>
 * 
 * Description:
 * Mastik Toolkit cache time anaylsis on L1I, L1D, LLC and DRAM
 * 
 */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <x86intrin.h>
#include <sched.h>
#include <assert.h>
#include <sys/types.h>

#include "header.h"

// Define constants
//#define ITER 100000
#define ITER 200000
#define PAGE_SIZE 4096

/****************************************************************************************/
// Mastik l1i.c

#define L1I_ASSOCIATIVITY 8
#define L1I_CACHELINE 64
#define L1I_SETS 64 // Typically 64 sets in L1i cache

#define L1D_ASSOCIATIVITY 8
#define L1D_CACHELINE 64
#define L1D_SETS 64


#define JMP_OFFSET (PAGE_SIZE - 5)

#define JMP_OPCODE 0xE9
#define RET_OPCODE 0xC3

struct l1ipp {
    void *memory;
    uint8_t monitored[L1I_SETS];
    void *sets[L1I_SETS];
    int nsets;
};

typedef struct l1ipp *l1ipp_t;

#define SET(page, set, l1) (((uint8_t *)l1->memory) + PAGE_SIZE * (page) + L1I_CACHELINE * (set))

typedef void (*fptr)(void);
void l1i_randomise(l1ipp_t l1);


l1ipp_t l1i_prepare(void) {
    l1ipp_t l1 = (l1ipp_t)malloc(sizeof(struct l1ipp));
    l1->memory = mmap(0, PAGE_SIZE * L1I_ASSOCIATIVITY, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANON, -1, 0);
    if (l1->memory == MAP_FAILED) {
        perror("mmap");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < L1I_SETS; i++) {
        for (int j = 0; j < L1I_ASSOCIATIVITY - 1; j++) {
            uint8_t *p = SET(j, i, l1); 
 	    *p++ = JMP_OPCODE;
            *p++ = JMP_OFFSET & 0xff;           // Lower 8 bits of offset
            *p++ = (JMP_OFFSET >>8) & 0xff;     // Next 8 bits
            *p++ = (JMP_OFFSET >> 16) & 0xff;   // Next 8 bits
            *p++ = (JMP_OFFSET >> 24) & 0xff;   // Upper 8 bits (total 32 bits)
        }
        uint8_t *p = SET(L1I_ASSOCIATIVITY -1, i, l1);
        *p = RET_OPCODE;
    }

    l1->nsets = L1I_SETS;
    for (int i = 0; i < L1I_SETS; i++)
        l1->monitored[i] = i; // Used for probing stage

    
    l1->nsets = L1I_SETS;
    l1i_randomise(l1);
    return l1;
}

void l1i_randomise(l1ipp_t l1) {
  char *mem = (char *)l1->memory;
  for (int i = 0; i < l1->nsets; i++) {
    int p = random() % (l1->nsets - i) + i;
    uint8_t t = l1->monitored[p];
    l1->monitored[p] = l1->monitored[i];
    l1->monitored[i] = t;
  }
}

void l1i_probe(l1ipp_t l1) {
    for (int i = 0; i < l1->nsets; i++) {
        fptr func = (fptr)SET(0, l1->monitored[i], l1);
        func();
    }
}

/****************************************************************************************/

extern void oracle_code_page(void);
void mfence() { asm volatile("mfence"); }

void waste_cycle(uint64_t n){
    for(uint64_t i = 0; i < n; i++);
}

void warmup(){
    waste_cycle(50000);
}

void print_list(uint64_t * list, uint32_t count)
{

    for(uint32_t i = 100000; i < count; i++)
    {
        printf("%lu, ", list[i]);

    }
    printf("\n");

}

l1ipp_t l1i = NULL; 
fptr test_func = NULL; 

void prepare_l1()
{
    load_time((uint64_t *)test_func);
    waste_cycle(10000);
    mfence();
}

void prepare_l1i() {
    l1i_probe(l1i);
    waste_cycle(10000);
    mfence();
}

void prepare_l2()
{
    load_time((uint64_t *)test_func);
    evict_n(1024*32);
    waste_cycle(50000);
    mfence();
}
void prepare_l3()
{
    load_time((uint64_t *)test_func);
    evict_n(1024*1024);
    waste_cycle(50000);
    mfence();
}
void prepare_DRAM()
{
    flush_time((uint64_t *)test_func);
    waste_cycle(10000);
    mfence();
}

void run_test(uint64_t * tSamples, void (*prepare)(), void (*test_func)(), uint32_t count)
{

    memset(tSamples, 0, sizeof(uint64_t) * count);
    for(uint32_t i = 0; i < count; i++)
    {
        prepare();

        unsigned int aux;
        uint64_t start = __rdtscp(&aux);
       	test_func();
	uint64_t end = __rdtscp(&aux);
        tSamples[i] = end - start;
    }
}

int main(void)
{
    l1i = l1i_prepare();

    if (mprotect(l1i->memory, PAGE_SIZE * L1I_ASSOCIATIVITY, PROT_READ | PROT_EXEC) != 0) {
        perror("mprotect");
        exit(EXIT_FAILURE);
    }

    warmup();
    uint64_t * tSamples = malloc(sizeof(uint64_t) * ITER);

    test_func = (fptr)SET(0, 0, l1i);

    void (*prepare_functions[])() = {
        prepare_l1,
	//prepare_l2,
        prepare_l1i,
	prepare_l2,
        prepare_l3,
        prepare_DRAM
    };

    for(uint32_t j = 0; j < sizeof(prepare_functions)/sizeof(void (*)()); j++)
    {
        run_test(tSamples, prepare_functions[j], test_func, ITER);
        print_list(tSamples, ITER);
    }

    munmap(l1i->memory, PAGE_SIZE * L1I_ASSOCIATIVITY);
    free(l1i);
    free(tSamples);

    return 0;
}

