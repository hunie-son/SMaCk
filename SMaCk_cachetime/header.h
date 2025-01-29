
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <sys/mman.h>

/* see asm.S */

extern uint64_t base_line(void);
extern uint64_t load_time(uint64_t * address);
extern uint64_t flush_time(uint64_t * address);
extern uint64_t flushopt_time(uint64_t * address);
extern uint64_t store_time(uint64_t * address);
extern uint64_t lms_time(uint64_t * address);
extern uint64_t prefetch_time(uint64_t * address);
extern uint64_t prefetchnta_time(uint64_t * address);
extern uint64_t exec_time(uint64_t * address);
extern uint64_t writeback_time(uint64_t * address);


void oracle_code_page(void);
void evict_n(uint64_t count);
