
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <sys/mman.h>

/* see asm.S */
extern uint64_t tt;

extern uint64_t flush_time(uint32_t offset);
extern void flush_oracle(uint32_t offset);
extern void spectreSend(unsigned char * notsecret, uint32_t index, uint32_t limit);
void oracle_code_page();


extern uint64_t load_time(uint32_t offset);
extern uint64_t flush_time(uint32_t offset);
extern uint64_t flushopt_time(uint32_t offset);
extern uint64_t store_time(uint32_t offset);
extern uint64_t lms_time(uint32_t offset);
extern uint64_t prefetch_time(uint32_t offset);
extern uint64_t prefetchnta_time(uint32_t offset);
extern uint64_t exec_time(uint32_t offset);
extern uint64_t clwriteback_time(uint32_t offset);



