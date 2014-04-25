Quickstart for master-less salt config
=====================================
Steps

    1) wget -O - http://bootstrap.saltstack.org | sudo sh

    2) sudo ln -s /home/johnnyg/salt-states /srv/salt

    3) sudo salt-call --local state.highstate test=True
   
OR

    sudo bash quick_start.sh
