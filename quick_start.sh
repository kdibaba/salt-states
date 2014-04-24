#sudo apt-get -y install git
#sudo apt-get -y install vim
cd ~/
git clone https://github.com/johnnygaffey/dotfiles.git
cd ~/dotfiles/
bash install.sh -b
cd ~/
wget - https://www.dropbox.com/s/hh7afxftgl5tt4m/userdata.tar.gz
cd ~/
wget -O - http://bootstrap.saltstack.org | sudo sh
sudo ln -s /home/johnnyg/salt-states /srv/salt
#sudo vim /etc/salt/minion
sudo salt-call --local state.highstate #test=True
