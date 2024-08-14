#!/bin/bash

# Log file location for log management
log_management_log="/var/log/log_management.log"

# Path to the intrusion detection script's log file
intrusion_log_file="/var/log/intrusion.log"

# Path to the intrusion detection script
intrusion_script="/home/emily/scripts/intrusion_detection_script.sh"

# Date and time for log entry
date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Start of the script
echo "[$date_time] Starting log management script..." >> $log_management_log 

# Run the intrusion detection script and capture its output
echo "[$date_time] Running intrusion detection script..." >> $log_management_log
if [ -f "$intrusion_script" ]; then
    sudo $intrusion_script >> $log_management_log 2>&1
else
    echo "[$date_time] Error: Intrusion detection script not found." >> $log_management_log
fi
# Append the intrusion detection script's log to the log management log
echo "[$date_time] Logging content of the intrusion detection log:" >> $log_management_log
cat "$intrusion_log_file" >> $log_management_log

# Log script completion
echo "[$date_time] Log management script completed." >> $log_management_log

