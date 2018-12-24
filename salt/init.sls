include:
  - salt.pillar

/etc/salt/minion:
  file.managed:
    - source: salt://salt/minion

https://github.com/johnnygaffey/salt-states:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-states
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa

link_salt_pillar:
  file.symlink:
    - name: /srv/pillar
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

link_salt:
  file.symlink:
    - name: /srv/salt
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-states
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

states_dir:
  file.exists:
  - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-states

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-states/.git/config:
  file.managed:
    - source: salt://salt/config
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 644
    - require:
      - file: states_dir

