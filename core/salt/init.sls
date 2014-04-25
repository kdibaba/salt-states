/etc/salt/minion:
  file.managed:
    - source: salt://core/salt/minion

https://github.com/johnnygaffey/salt-states:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-states
