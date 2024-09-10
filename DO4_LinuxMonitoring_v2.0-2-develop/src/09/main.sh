#!/bin/bash

while true
do
CPU=$(mpstat 1 1 | awk 'NR==4 {print $12}' | sed 's/,/./')
MEM_TOTAL=$(free -b | awk 'NR==2{print $2}')
MEM_FREE=$(free -b | awk 'NR==2{print $4}')
F_SIZE=$(df -B 1 | grep dev/mapper | awk '{print $2}')
F_AVAIL=$(df -B 1 | grep dev/mapper | awk '{print $4}')

echo "my_node_cpu_seconds_total $CPU
my_node_memory_MemTotal_bytes $MEM_TOTAL
my_node_memory_MemFree_bytes $MEM_FREE
my_node_filesystem_size_bytes $F_SIZE
my_node_filesystem_avail_bytes $F_AVAIL" > /var/www/html/metrics.txt
sleep 5
done
