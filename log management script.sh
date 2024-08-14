#!/bin/bash

# Define the log file path
log_file="/var/log/log_management.log"

# Ensure the log file exists and is writable
if [ ! -f "$log_file" ]; then
    sudo touch "$log_file"
    sudo chmod 666 "$log_file"
fi

# Log the start of the script with the current date and time
echo "$(date '+%Y-%m-%d %H:%M:%S'): Log management script started" >> "$log_file"

# Record the start time of the session
start_time=$(date '+%s')

# Sample log management actions (add more actions as needed)
echo "$(date '+%Y-%m-%d %H:%M:%S'): Checking user login attempts..." >> "$log_file"
last -a >> "$log_file"

echo "$(date '+%Y-%m-%d %H:%M:%S'): Checking failed SSH login attempts..." >> "$log_file"
grep "Failed password" /var/log/auth.log >> "$log_file"

# Record the end time of the session
end_time=$(date '+%s')

# Calculate the duration of the session
duration=$((end_time - start_time))

# Log the end of the script with the duration of the session
echo "$(date '+%Y-%m-%d %H:%M:%S'): Log management script completed in $duration seconds" >> "$log_file"

# Provide feedback that the script ran successfully
echo "Log management script ran successfully."

