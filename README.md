# SMaCk: Efficient Instruction Cache Attacks via Self-Modifying Code Conflicts

SMaCk is a comprehensive toolkit for executing efficient instruction cache attacks via self-modifying code (SMC) conflicts on x86 processors. We leverage the L1 instruction cache by inducing SMC conflicts, which create measurable timing discrepancies that can be exploited for covert channel attacks and sensitive information leakage. Our toolkit demonstrates that SMC mechanisms in modern Intel and AMD microarchitectures can be utilized to enhance traditional Prime+Probe and Spectre attacks on the L1 instruction cache, enabling the extraction of cryptographic keys and the establishment of high bandwidth.
To validate our approach, we assume that the attacker injects malicious code into a user-space application running on the victim's device, which monitors instruction cache timings to infer sensitive operations performed by the victim. We collect extensive cache timing traces from 10 distinct x86 microarchitectures, including Intel Cascade Lake, Comet Lake, and AMD Ryzen 5, across multiple cryptographic libraries.

## Experimental Setup: 
* The experiment can be conducted in 10 different (Intel and AMD) microarchitectures (Table 3 in the paper).
* Here is the example of Intel Microarchitecture Setup
- ### Intel Cascade Lake Microarchitecture
  * CPU Model: Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz (microcode: 0x5003707)
  * OS: Ubuntu 20.04.6 LTS
  * Linux Kernel: 5.15.0-119-generic
 
- ### Additional
  * Software: MATLAB R2021
    
## Implementation 
- ### Analyzing SMC Conflict with Various x86 Instructions:
  * This process can be done in the 10 different specific microarchitectures (Table 3 in the paper).<br/>
  * Data collection for target microarchitecture.<br/>
  `cd SMaCk/SMaCk_cachetime`<br/>
  `make`<br/>
  `taskset -c {core#} ./smack_cachetime > {name}_csv`<br/>

  * Data collection for Mastik Toolkit for baseline comparison.<br/>
  `cd SMaCk/Mastik_cachetime`<br/>
  `make`<br/>
  `taskset -c {core#} ./mastik_cachetime > {name}_csv`<br/>
  
  * Draw plot for analysis (Matlab) <br/>
  adjust code with file name from above
  `cache_draw.m`<br/>

  * Datasets <br/>
  `cd SMaCk/SMaCk_cachetime/data`<br/>
  `cd SMaCk/Mastik_cachetime/data`<br/>

- ### SMaCk Prime and IProbe attack:
  * Performing Prime and IProbe attack  <br/>
  `cd SMaCk/SMaCk_PNP`<br/>
  `python prime_probe_gen.py {fucntion name} i`<br/>
  `make`<br/>
  `taskset -c {core#} ./pnp_attack <target_set> <delay_cycle> <nsamples>`<br/>

  * Performing Mastik Prime and Probe attack for baseline <br/>
  `cd SMaCk/Mastik_PNP`<br/>
  `make`<br/>
  `taskset -c {core#} ./mastik_pnp <target_set> <delay_cycle> <nsamples>`<br/>
  
- ### SMaCk ISpectre attack:
  * Performing Prime and IProbe attack <br/>
  * Function name: load, flush, flushopt, store, lock, prefetch, prefetchnta, execute, clwb <br/>
  * Iteration: Iteration for the attack <br/>
  * Anomaly: based on the smack_cachetime figure (ex., 500 or 600) <br/>
  `cd SMaCk/SMaCk_ISpectre`<br/>
  `make`<br/>
  `taskset -c {core#} ./smack_ispectre <Function_name> <Iteration> <Anomaly>`<br/>
