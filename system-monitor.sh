#!/bin/bash

# Set the threshold values for CPU usage, memory usage, and disk space
cpu_threshold=80
memory_threshold=80
disk_threshold=80

# Get the current system statistics
cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk_usage=$(df -h / | awk '{print $5}' | sed 's/%//g')

# Check if any of the thresholds have been exceeded
if [ $cpu_usage -gt $cpu_threshold ]; then
  echo "CPU usage is at ${cpu_usage}%, exceeding the threshold of ${cpu_threshold}%."
fi

if [ $memory_usage -gt $memory_threshold ]; then
  echo "Memory usage is at ${memory_usage}%, exceeding the threshold of ${memory_threshold}%."
fi

if [ $disk_usage -gt $disk_threshold ]; then
  echo "Disk usage is at ${disk_usage}%, exceeding the threshold of ${disk_threshold}%."
fi

# Output a message to confirm completion
echo "System monitoring completed."
