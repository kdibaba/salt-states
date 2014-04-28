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
  cmd.wait_script:
    - source: https://raw.githubusercontent.com/johnnygaffey/dotfiles/master/install.sh
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - shell: /bin/bash
    - args: '-b'
    - watch: 
      - git: https://github.com/johnnygaffey/dotfiles

ssh_keys:
  ssh_auth.present:
    - names:
      - {{ salt['pillar.get']('users:johnny:ssh:dev', 'nothing') }}
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

