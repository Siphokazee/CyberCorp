#!/bin/bash

# Log file location
log_file="/var/log/intrusion_detection.log"

# Network interface to monitor (e.g., eth0, ens33)
network_interface="eth0"

# Define your local IP range (e.g., 192.169.72.0/24)
local_ip_range="192.168.72.0/24"

# Date and time for log entry
date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Start of the script
echo "[$date_time] Starting intrusion detection script..." >> $log_file

# Check for incoming traffic from IP addresses outside the specified range
count=$(sudo iptables -nvL --line-numbers | grep "$network_interface" | grep -v "$local_ip_range" | wc -l)

if [ "$count" -gt 0 ]; then
    echo "[$date_time] Warning: External traffic detected on $network_interface." >> $log_file
    echo "[$date_time] Script completed - External traffic detected."
else
    echo "[$date_time] No external traffic detected on $network_interface." >> $log_file
    echo "[$date_time] Script completed - No external traffic."
fi

# End of the script
echo "[$date_time] Finished intrusion detection script." >> $log_file

 
