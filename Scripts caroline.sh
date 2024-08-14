system updates
#!/bin/bash
# below command will Update package lists
sudo apt update
# below command will Upgrade the packages that can be upgraded
sudo apt upgrade -y
# below command will Remove unnecessary packages and dependencies for good memory management
sudo apt autoremove -y
# below command will Clean package cache
sudo apt clean -y
# below command will Display system update status on terminal to know if the update and upgrade is successfull
echo "System updates and upgrades completed successfully."

firewall configuration
#!/bin/bash
# Define the log file where the script execution details will be recorded
log_file="/var/log/script_execution.log"
# Ensure the log file exists or create it
touch $log_file
# Log the start time of the script
start_time=$(date)
echo "Script started at: $start_time" >> $log_file
# Perform some dummy log management tasks here (replace with real tasks)
# For example, listing logged-in users
who >> $log_file
# Log the end time of the script
end_time=$(date)
echo "Script ended at: $end_time" >> $log_file
# Calculate the duration
duration=$(date -u -d "0 $end_time sec - $start_time sec" +"%H:%M:%S")
# Log the duration
echo "Script duration: $duration" >> $log_file
# Output success message to the terminal
echo "Log management script ran successfully"
# Check if there were any errors (dummy check, replace with real error checks)
# For example, you could check if a command failed and log accordingly.
if [ $? -eq 0 ]; then
    echo "$(date): Log management completed successfully" >> $log_file
else
    echo "$(date): Log management encountered errors" >> $log_file
    echo "Log management script ran unsuccessfully"
fi 
