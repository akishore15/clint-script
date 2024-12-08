#!/bin/bash
sudo apt install git
sudo ufw allow 5000/tcp
git clone https://github.com/akishore15/clint-script.git --p 5000
echo "GIT CLONED, MAPPED AT localhost:5000"
echo "CONTINUE [Y / N]"
read ans1
if [ $ans1 -eq "Y" ]
then
echo "OK!"
else
echo "Abort."
portmap=ls --p 5000
export portmap
echo "$portmap"
echo "Do you still want to delete this info? [Y / N]"
read confirmans1
if [ $confirmans1 -eq "Y" ]
then
echo "Deleting data permanently..."
sudo kill -9 $(sudo lsof -t -i:5000)
else
echo "OK. BOOTING PORT 85..."
google-chrome localhost:5000
