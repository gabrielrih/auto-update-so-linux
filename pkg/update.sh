#!/bin/bash

#Update/Upgrade/Cleaning
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get --fix-broken install -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get full-upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get --purge autoremove -y
sudo apt-get clean
sudo apt-get autoclean