#!/bin/bash
for Users in $(ls /home)
do 
sudo -lU $Users

done
