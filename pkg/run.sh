#!/bin/bash

# Control of logs
#

# Color variables 
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"


# Checking input parameters
if [ $# -lt 2 ]; then
        echo -e "${RED}Error!${NOCOLOR} ${GREEN}You must input the log folder and the full path update script as parameters.${NOCOLOR}"
        echo -e "${GREEN}EXAMPLE:${NOCOLOR} $0 /var/log/auto-update-so /opt/auto-update-so/update.sh"
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