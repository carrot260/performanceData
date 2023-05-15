#!/bin/bash
set -o errexit
set -o xtrace

mkdir perf_output

# Gather some metrics about resource utilization on the system

top -b -n 10 > perf_output/top.out
vmstat 1 10 > perf_output/vmstat.out
iostat -xmdz 1 10 > perf_output/iostat.out
sar -n DEV 1 10 > perf_output/sar.out
iftop -PBt -s 40 > perf_output/iftop.out

# tar the output. Send us perf_output.tar.gz
tar cfzv perf_output.tar.gz perf_output