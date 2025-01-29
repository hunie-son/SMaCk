/*
 * SMaCk cache time anaylsis (root causes)
 *
 * 
 * authors: 
 * Seonghun Son <seonghun@iastate.edu>
 * Daniel Moghimi <danielmm@googl.com>
 * Berk Gulmezoglu <bgulmez@iastate.edu>
 * 
 * Description:
 * SMaCk cache time anaylsis on L1I, L1D, LLC and DRAM
 * 
 */

#include "header.h"
#include <papi.h>
#include <fcntl.h>
#include "cacheutils.h"

//Make it 100000 to 150000 due to the noise.
//Ignore first 50000 and keep 100000
#define ITER 100000
//#define ITER 150000
//#define ITER 1


void waste_cycle(uint64_t n){
    for(uint64_t i = 0; i < n; i++);
}

void warmup(){    
    waste_cycle(50000);
}

//Print the results
void print_list(uint64_t * list, uint32_t count)
{
    //for(uint32_t i = 0; i < count; i++)
    for(uint32_t i = 50000; i < count; i++)
    {
        printf("%lu, ", list[i]);
    }
    printf("\n");
}

//Preparing L1D cache by loading oracle_code_page
void prepare_l1()
{
    load_time((uint64_t *)oracle_code_page);
    waste_cycle(10000);
    mfence();
}

//Preparing L1 Insutction cache by reading insturction cache line by orcacle_code_page()
void prepare_l1i()
{
    store_time((uint64_t *)oracle_code_page);
    flush_time((uint64_t *)oracle_code_page);
    oracle_code_page();
    waste_cycle(10000);
    //mfence();
}

//Preparing L2 cache by load oracle_code_page and evivt 32KB
void prepare_l2()
{
    load_time((uint64_t *)oracle_code_page);
    evict_n(1024*32);
    waste_cycle(50000);
    mfence();
}

//Preparing L3 cache by load oracle_code_page and evivt 1MB
void prepare_l3()
{
    load_time((uint64_t *)oracle_code_page);
    evict_n(1024*1024);
    waste_cycle(50000);
    mfence();
}


//Preparing DRAM
void prepare_DRAM()
{

    flush_time((uint64_t *)oracle_code_page);
    waste_cycle(10000);
    mfence();
}

typedef void t_prepare();
typedef uint64_t t_time(uint64_t * address);

void run_test(uint64_t * tSamples, t_prepare * prepare, t_time * time, uint32_t count)
{
    memset(tSamples, 0, sizeof(uint64_t) * count);
    for(uint32_t i = 0; i < count; i++)
    {
        prepare();
        tSamples[i] = time((uint64_t *)oracle_code_page);
    }

}

t_prepare *prepare_functions[] = {
    //prepare_l1, 
    prepare_l2,
    prepare_l1i,
    //prepare_l2, 
    prepare_l3, 
    prepare_DRAM
};

//9 different x86 instructions 
t_time * time_functions[] = {
    load_time, 
    flush_time, 
    flushopt_time, 
    store_time, 
    lms_time, 
    prefetch_time, 
    prefetchnta_time, 
    exec_time,
    writeback_time,
};



void root_causes(){

	int i,j;
	uint64_t t0, t1, delta;

	uint64_t value;
	
	
	volatile uint64_t X =1;

//	mfence();
	X =1;


	t0 = rdtsc();

/*
	//flush
	asm volatile (
		"clflush (%0)\n"
		:
		: "r" (oracle_code_page)
		: "memory"
	);
*/


	for (j = 0; ; j++) {
		t1 = rdtsc();
		delta = t1 - t0;
		printf(" %lu \n", delta);	
		
		if (delta >1000 )
		{
			break;
		}

		//t0 = t1; // the next iteration
		//t0=rdtsc();
		//printf(" %lu \n", delta);	
		t0=rdtsc();
	}
	printf("Hiccup after %d tries\n", j);
	printf("\n");
	
//	}

}


int main(int argc, char **argv)
{
    mprotect((uint64_t *)oracle_code_page, 16384*64, PROT_READ|PROT_WRITE|PROT_EXEC);
    warmup();
    uint64_t * tSamples = malloc(sizeof(uint64_t) * ITER);
    
    //root_causes();
    mfence();
    for(uint32_t i = 0; i < sizeof(time_functions)/sizeof(t_time*); i++)
    {   
        for(uint32_t j = 0; j < sizeof(prepare_functions)/sizeof(t_prepare*); j++)
        {
            run_test(tSamples, prepare_functions[j], time_functions[i], ITER);
            print_list(tSamples, ITER);
        }
    }
}


