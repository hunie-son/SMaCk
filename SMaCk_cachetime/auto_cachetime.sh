#!/bin/bash


taskset -c 2 ./smack_cachetime > cache_time_cascadelake.csv
sleep 1
killall smack_cachetime


