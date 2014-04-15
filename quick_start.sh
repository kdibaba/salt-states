sudo apt-get -y install git
sudo apt-get -y install vim
cd ~/
git clone https://github.com/johnnygaffey/dotfiles.git
cd ~/dotfiles/
bash install.sh
wget -O - http://bootstrap.saltstack.org | sudo sh
cd ~/
sudo ln -s /home/johnnyg/salt-states /srv/salt
sudo vim /etc/salt/minion
sudo salt-call state.highstate test=True
