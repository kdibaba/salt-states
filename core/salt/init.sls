/etc/salt/minion:
  file.managed:
    - source: salt://core/salt/minion

https://github.com/johnnygaffey/salt-states:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-states
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

https://SGTJohnny@bitbucket.org/SGTJohnny/salt-pillar.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa

link_salt_pillar:
  file.symlink:
    - name: /srv/pillar
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - require:
      - git: https://SGTJohnny@bitbucket.org/SGTJohnny/salt-pillar.git

salt_cron:
  cron.present:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - minute: 0
    - hour: 18
    - name: sudo salt-call state.highstate
