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
    
## Experiments
- ### Analyzing SMC Conflict with Various x86 Instructions:
  * This process can be done in the 10 different specific microarchitectures (Table 3 in the paper).
  `cd DefWeb/Data_Collection`<br/>
  `cd DefWeb/Data_Collection`<br/>
  `./run_demo_chrome.sh`<br/>
  
