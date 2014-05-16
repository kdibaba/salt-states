/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-pillar/.git/config:
  file.managed:
    - source: salt://core/pillar/config
    - present

ssh://git@bitbucket.org/SGTJohnny/salt-pillar.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa.pub

