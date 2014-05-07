Quickstart for master-less salt config
=====================================
Steps

    1) wget -O - http://bootstrap.saltstack.org | sudo sh

    2) sudo ln -s /home/johnnyg/salt-states /srv/salt

    3) sudo salt-call --local state.highstate test=True
   
OR

    sudo bash quick_start.sh

things i neglected:
    Script must be run by user johnnyg still or symnlinks won't work.
    
    All hard drives must be mounted AND set to auto mount at boot.
    
    UnionFS needs to be setup for movies
    
    xbmc userdata only half worked. maybe due to version change 12->13
