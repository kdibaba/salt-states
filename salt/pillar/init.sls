ssh://git@bitbucket.org/ALazyDeveloper/salt-pillar.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-pillar
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa


pillar_dir:
  file.exists:
  - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-pillar

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/salt-pillar/.git/config:
  file.managed:
    - source: salt://salt/pillar/config
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 644
    - require:
      - file: pillar_dir

