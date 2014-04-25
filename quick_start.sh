cd ~/
#wget - https://www.dropbox.com/s/hh7afxftgl5tt4m/userdata.tar.gz
wget -O - http://bootstrap.saltstack.org | sudo sh
sudo ln -s /home/johnnyg/salt-states /srv/salt
sudo salt-call --local state.highstate #test=True
