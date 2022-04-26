#!/bin/bash

# Checking input parameters
if [ $# -lt 2 ]; then
        echo "Error! You must input the log folder and the full path update script as parameters."
        echo "EXAMPLE: $0 /var/log/auto-update-so /opt/auto-update-so/update.sh"
        exit 1
fi

LOG_FOLDER=$1
UPDATE_SCRIPT_FULLPATH=$2
LOG_FILENAME="update-"$(date +%s)".log"
LOG_FULLPATH=$LOG_FOLDER"/"$LOG_FILENAME

# It creates the log folder 
if [ ! -d "$LOG_FOLDER" ]; then
        mkdir $LOG_FOLDER
else # Deleting log files older than 90 days
        find $LOG_FOLDER -type f -mtime +90 -delete
fi

# Starting updating script
$UPDATE_SCRIPT_FULLPATH >> $LOG_FULLPATH

exit 0