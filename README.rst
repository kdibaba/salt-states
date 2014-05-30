Quickstart for master-less salt config
======================================

Run following one-liner::

    wget -O - https://raw.githubusercontent.com/johnnygaffey/salt-states/master/quick_start.sh | bash -s -- <pillar-repo>

Or this two-liner::

    wget https://raw.githubusercontent.com/johnnygaffey/salt-states/master/quick_start.sh
    bash quick_start.sh <pillar-repo>

Where ``<pillar-repo>`` is a git repo will salt pillar data.


TO-DO:

* UnionFS needs to be setup for movies
* setup nfs to share media with windows networked computers
