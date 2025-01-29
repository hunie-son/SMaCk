#!/bin/bash

#./test <target_set> <delay_cycle> <nsamples> <delay_interval>!!!


#rsa_Final
#mul_n : set 18 
#_gcry_mpih_sqr_n : set 44
#_gcry_mpih_divrem : set 32


#MUL is set 36
#SQURE is set 1



for((i=1;i<=1;i++))
do
	
	taskset -c 2 ../PNP_variants/./pnp_attack 18 1000 50000 > result.txt &
	sleep 0.05 

	taskset -c 34 .././rsa_Final & 
	
	wait
	echo " Done $i"
	
	sleep 2
done




