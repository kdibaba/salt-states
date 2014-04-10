Quickstart for master-less salt config
=====================================
Steps

    1) wget -O - http://bootstrap.saltstack.org | sudo sh

    2) sudo vim /etc/salt/minion then change #file_client: remote to
       file_client: local
    
    3) sudo ln -s /home/johnnyg/salt-states /srv/salt

    4) salt-call state.highstate test=True
