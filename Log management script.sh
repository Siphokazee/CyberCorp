#!/bin/bash

# Log file location for log management
log_file="/var/log/log_management.log"

# Path to the intrusion detection script: THIS WILL NEED TO BE CHANGED and logs of pther scripts could be pasted here too 
intrusion_script="/home/user/scripts/intrusion_detection.sh"

# Date and time for log entry
date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Start of the script
echo "[$date_time] Starting log management script..." >> $log_file

# Run the intrusion detection script and capture its output
echo "[$date_time] Running intrusion detection script..." >> $log_file
if [ -f "$intrusion_script" ]; then
    sudo $intrusion_script >> $log_file 2>&1
else
    echo "[$date_time] Error: Intrusion detection script not found." >> $log_file
fi

# Log script completion
echo "[$date_time] Log management script completed." >> $log_file
