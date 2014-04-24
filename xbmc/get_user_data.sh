#!/bin/bash

if [ ! -d "/home/johnnyg/.xbmc/"]; then
    mkdir /home/johnnyg/.xbmc/
fi
cd /home/johnnyg/.xbmc/
if [ ! -d "/home/johnnyg/.xbmc/userdata"]; then
    wget - https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
    tar -zxvf userdata.tar.gz
    rm userdata.tar.gz
fi
    rm /home/johnnyg/.xbmc/userdata/
    wget - https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
    tar -zxvf userdata.tar.gz
    rm userdata.tar.gz

