#!/bin/bash
INSTALLATION_FOLDER="/opt/auto-update-so"
LOG_FOLDER="/var/log/auto-update-so"
MAIN_SCRIPT_FILENAME="run.sh"
AUX_SCRIPT_FILENAME="update.sh"
MAIN_SCRIPT_FULLPATH=$INSTALLATION_FOLDER"/"$MAIN_SCRIPT_FILENAME
UPDATE_SCRIPT_FULLPATH=$INSTALLATION_FOLDER"/"$AUX_SCRIPT_FILENAME

# Is it root?
if [ $(whoami) != root ]; then
        echo "Error! Run it as root!"
        exit 1
fi

# Creating instalation folder
if [ ! -d  "$INSTALLATION_FOLDER" ]; then
        mkdir $INSTALLATION_FOLDER
fi

# Copying scripts
cp pkg/*.* $INSTALLATION_FOLDER

# Changing permition to allow executing
chmod -R 755 $INSTALLATION_FOLDER

# Configuring crontab (Weekly, monday 7:30 am)
# References:
#	https://crontab.guru/#30_7_*_*_1
#	https://www.baeldung.com/linux/create-crontab-script
crontab -l > .crontab_temp
numLines=$(cat .crontab_temp | grep $INSTALLATION_FOLDER | wc -l)
if [ $numLines -eq 0 ]
then
        echo "30 7 * * 1 $MAIN_SCRIPT_FULLPATH $LOG_FOLDER $UPDATE_SCRIPT_FULLPATH" >> .crontab_temp
        crontab .crontab_temp
fi
rm .crontab_temp

# Finishing
echo "It's done!"
exit 0