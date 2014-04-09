installed salt via:
curl -L http://bootstrap.saltstack.org | sudo sh

step 2 edit /etc/salt/minion uncommented file:

file_client: local

setup link for salt:
sudo ln -s /home/johnnyg/salt-states /srv/salt


