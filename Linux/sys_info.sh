#!/bin/bash

#if statement to check the existance of research directory  mkdir ~/research

if [ ! -d ~/research ]
then
fi

#if statement that checks for the existence of the file ~/research/sys_info.txt

if [ ! -f ~/research/sys_info.txt ]
then 
echo " "
else
rm ~/research/sys_info.txt
fi

#a title and todays date
echo "this is $PWD directory!"
echo  "today is $(date)"
echo " "
#the uname info for the machine
echo "this is user $(uname)"
echo " "
#the machine ip address
echo "this is IP adress short form $(hostname -I)"
echo " "
echo "this is IP address $(ip address)"
echo " "
echo "this is IP address $(ifconfig)"
echo " "
#the host name
echo "this is host name $(hostname)"
echo " "
 

#check if script was run as root exit if true
if [ $UID -eq 0 ]; then
 echo "please do not run this script as root"
 exit 
fi

#define variables
output=$HOME/research/sys_info.txt
ip=$9(ip addr | grep inet | tail -2 | tail -2 | heat -1)
execs=$(sudo find /home -type f -perm 777 2>/dev/null)

#check for research directory. create it if needed
if [ -f $output ]; then
 rm $output
fi

echo "A Quick System Audit Script" >>$output
date >>$output
echo "" >>$output
echo "machine type info:">>$output
echo -e "$Machtype \n" >>$output
echo -e"uname info: $(uname -a) \n" >>$output
echo -e "IP Info:" >>$output
echo -e "$ip \n" >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nexec Files:" >>$output
echo $execs >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >>$output
fi
done
