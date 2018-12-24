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

create_projects_dir:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 755

https://github.com/johnnygaffey/dotfiles:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/dotfiles
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa
    - require:
      - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
      - file: create_projects_dir
  cmd.wait_script:
    - source: https://raw.githubusercontent.com/johnnygaffey/dotfiles/master/install.sh
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - shell: /bin/bash
    - args: '-b'
    - watch:
      - git: https://github.com/johnnygaffey/dotfiles

dotfiles_dir:
  file.exists:
  - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/dotfiles

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/dotfiles/.git/config:
  file.managed:
    - source: salt://users/config
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 644
    - require:
      - file: dotfiles_dir


/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 700

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - create: True
    - contents_pillar: 'users:johnny:ssh:hots:private'
    - mode: 400
    - makedirs: True
    - require_in:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa.pub:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - create: True
    - mode: 644
    - contents_pillar: 'users:johnny:ssh:hots:public'
    - makedirs: True
    - require_in:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh

ssh_keys:
  ssh_auth.present:
    - names:
      - {{ salt['pillar.get']('users:johnny:ssh:dev:public', 'nothing') }}
      - {{ salt['pillar.get']('users:johnny:ssh:hots:public', 'nothing') }}
      - {{ salt['pillar.get']('users:johnny:ssh:J10:public', 'nothing') }}
      - {{ salt['pillar.get']('users:johnny:ssh:work:public', 'nothing') }}
      - {{ salt['pillar.get']('users:johnny:ssh:seedbox:public', 'nothing') }}
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
