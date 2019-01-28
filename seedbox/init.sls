include:
  - seedbox.rtorrent


/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/seedbox/:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/seedbox/autodl-setup:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - source: salt://seedbox/autodl-setup
    - require:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/seedbox/

https://github.com/Notos/seedbox-from-scratch:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/seedbox
    - require:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/seedbox/
