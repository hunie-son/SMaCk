#!/bin/bash


taskset -c 2 ./pnp_attack 10 1000 20000 > pnp_attack_result.txt
sleep 1
killall pnp_attack


