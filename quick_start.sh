cd ~/
git clone https://SGTJohnny@Bitbucket.org/SGTJohnny/salt-pillar.git
wget -O - http://bootstrap.saltstack.org | sudo sh
sudo ln -s /home/johnnyg/salt-states /srv/salt
cd ~/salt-states/
git remote set-url origin git@github.com:johnnygaffey/salt-states.git
sudo salt-call --local state.highstate #test=True

