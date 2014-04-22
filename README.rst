Quickstart for master-less salt config
=====================================
Steps

    1) wget -O - http://bootstrap.saltstack.org | sudo sh

    2) sudo ln -s /home/johnnyg/salt-states /srv/salt

    3) sudo salt-call --local state.highstate test=True
   
OR

    1) wget -O - http://bootstrap.saltstack.org | sudo sh

    2) sudo vim /etc/salt/minion 
        change #file_client: remote to file_client: local
    
    3) sudo ln -s /home/johnnyg/salt-states /srv/salt

    4) sudo salt-call state.highstate test=True
