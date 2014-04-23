#!/bin/bash

mkdir /home/johnnyg/.xbmc/
cd /home/johnnyg/.xbmc/
rm -r /home/johnnyg/.xbmc/userdata
wget - https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
tar -zxvf userdata.tar.gz
rm userdata.tar.gz
