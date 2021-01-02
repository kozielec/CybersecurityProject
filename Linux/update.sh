#!bin/bash

#ensure apt has all available updates
apt update -y

#upgrade all installed packages
apt upgrade -y

#install new packages, and uninstall any old packages that must be removed to install them
apt full-upgrade -y

#remove unused packages and their associated configuration files
apt autoremove --purge -y

#Perform with a single line of code
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y
