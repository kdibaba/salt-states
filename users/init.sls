johnny:
  group.present:
    - name: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  user.present:
    - fullname: Johnny Gaffey
    - home: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - shell: /bin/bash
    - optional_groups:
      - johnnyg
      - sudo
      - adm
    - name: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - createhome: True
    - password: - {{ salt['pillar.get']('users:johnny:password', 'password') }}



get_johnny_dots:
  git.latest:
    - name: https://github.com/johnnygaffey/dotfiles
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - require:
      - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

install_johny_dots:
  cmd.script:
    - source: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/dotfiles/install.sh
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - shell: /bin/bash
    - args: '-b'
    - require:
      - git: latest
