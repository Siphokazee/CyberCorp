#!/bin/bash

# Log file location
log_file="/var/log/intrusion.log"

# Ensure log file exists and is writable
[ ! -e "$log_file" ] && sudo touch "$log_file"
sudo chmod 666 "$log_file"

# Date and time for log entry
date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Start of the script
{
    echo "[$date_time] Starting intrusion detection script..."

    # Capture recent SSH login attempts
    ssh_logins=$(grep "sshd" /var/log/auth.log | grep "Accepted" | awk '{print $1, $2, $3, $11}' | sort | uniq)
    
    # Capture recent network connections
    network_activity=$(ss -tuln | awk '{print $5}' | grep -oP '(\d+\.\d+\.\d+\.\d+)' | sort | uniq)

    # Log SSH login attempts
    if [ -n "$ssh_logins" ]; then
        echo "[$date_time] Recent SSH login attempts:" >> "$log_file"
        echo "$ssh_logins" >> "$log_file"

else
        echo "[$date_time] No recent SSH login attempts." >> "$log_file"
    fi

    # Log recent network connections
    if [ -n "$network_activity" ]; then
        echo "[$date_time] Recent network activity:" >> "$log_file"
        echo "$network_activity" | while read -r ip; do
            echo "[$date_time] Activity from IP: $ip" >> "$log_file"
        done
    else
        echo "[$date_time] No recent network activity detected." >> "$log_file"
    fi

    echo "[$date_time] Finished intrusion detection script." >> "$log_file"
} 2>&1 | tee -a "$log_file"


