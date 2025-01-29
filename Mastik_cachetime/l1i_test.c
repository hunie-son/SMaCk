// Include necessary headers
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>
#include <sys/mman.h>
#include <x86intrin.h>
#include <sched.h>

// Include Mastik headers
#include "low.h"
#include "l1i.h"

// Define constants
#define ITER 100000
#define CACHELINE_SIZE 64

// Function to waste CPU cycles
void waste_cycle(uint64_t n) {
    for (uint64_t i = 0; i < n; i++);
}

// Function to warm up the CPU/cache
void warmup() {
    waste_cycle(50000);
}

// Function to print timing samples
void print_list(uint64_t *list, uint32_t count) {
    for (uint32_t i = 0; i < count; i++) {
        printf("%lu, ", list[i]);
    }
    printf("\n");
}

// Function to prepare the code in L1i cache
void prepare_l1i(l1ipp_t l1i) {
    // Monitor all L1i sets
    l1i_monitorall(l1i);
    // Waste cycles to allow cache to settle
    waste_cycle(10000);
    mfence();
}

// Function to evict the code from L1i cache
void evict_l1i(l1ipp_t l1i) {
    // Evict the L1i cache by probing all sets
    uint16_t results[L1I_SETS];
    l1i_probe(l1i, results);
    // Waste cycles to allow cache to settle
    waste_cycle(10000);
    mfence();
}

// Function to run the test and collect timing samples
void run_test(uint64_t *tSamples, void (*prepare)(l1ipp_t), l1ipp_t l1i, uint32_t count) {
    memset(tSamples, 0, sizeof(uint64_t) * count);
    for (uint32_t i = 0; i < count; i++) {
        prepare(l1i);

        // Measure execution time of target function
        unsigned int aux;
        uint64_t start = __rdtscp(&aux);
        // Target function (some code to execute)
        asm volatile (
            "nop\n\t"
            "nop\n\t"
            "nop\n\t"
            "nop\n\t"
            "nop\n\t"
        );
        uint64_t end = __rdtscp(&aux);
        tSamples[i] = end - start;
    }
}

// Main function
int main(int argc, char **argv) {
    // Set CPU affinity to a single core for consistent measurements
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(0, &set);
    if (sched_setaffinity(getpid(), sizeof(set), &set) != 0) {
        perror("sched_setaffinity");
        exit(EXIT_FAILURE);
    }

    // Initialize Mastik's L1i cache manipulation
    l1ipp_t l1i = l1i_prepare();
    warmup();
    uint64_t *tSamples = malloc(sizeof(uint64_t) * ITER);

    // Array of preparation functions
    void (*prepare_functions[])(l1ipp_t) = {
        prepare_l1i,    // Prepare code in L1i cache
        evict_l1i       // Evict code from L1i cache
    };

    // Run tests for each preparation function
    for (uint32_t j = 0; j < sizeof(prepare_functions) / sizeof(void (*)(l1ipp_t)); j++) {
        run_test(tSamples, prepare_functions[j], l1i, ITER);
        print_list(tSamples, ITER);
    }

    // Clean up
    l1i_release(l1i);
    free(tSamples);

    return 0;
}

