#!/bin/bash


taskset -c 2 ./pnp_attack_victim 10 1000 20000 > pnp_attack_victim_result.txt
sleep 1


