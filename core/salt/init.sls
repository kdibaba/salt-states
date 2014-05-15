/etc/salt/minion:
  file.managed:
    - source: salt://core/salt/minion

https://github.com/johnnygaffey/salt-states:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-states
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

link_salt_pillar:
  file.symlink:
    - name: /srv/pillar
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

salt_cron:
  cron.present:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - minute: 0
    - hour: 18
    - name: sudo salt-call state.highstate
