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
    - password: {{ salt['pillar.get']('users:johnny:password', 'password') }}

https://github.com/johnnygaffey/dotfiles:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/dotfiles
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa
    - require:
      - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

install_johny_dots:
  cmd.script:
    - source: https://raw.githubusercontent.com/johnnygaffey/dotfiles/master/install.sh
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - shell: /bin/bash
    - args: '-b'
    - watch: 
      - git: https://github.com/johnnygaffey/dotfiles

