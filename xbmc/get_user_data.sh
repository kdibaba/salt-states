#!/bin/bash

if [ ! -d "/home/johnnyg/.xbmc/"]; then
    sudo mkdir /home/johnnyg/.xbmc/
fi
cd /home/johnnyg/.xbmc/
if [ -d "/home/johnnyg/.xbmc/userdata"]; then
    sudo rm -r /home/johnnyg/.xbmc/userdata
fi
sudo wget - https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
sudo tar -zxvf userdata.tar.gz
sudo rm userdata.tar.gz
