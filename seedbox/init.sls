include:
  - seedbox.rtorrent
  - seedbox.rutorrent


/home/{{ salt['pillar.get']('users:johnny:username', 'qma') }}/projects/seedbox/:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'qma') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'qma') }}

/home/{{ salt['pillar.get']('users:johnny:username', 'qma') }}/projects/seedbox/autodl-setup:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'qma') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'qma') }}
    - source: salt://seedbox/autodl-setup
    - require:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'qma') }}/projects/seedbox/

https://github.com/Notos/seedbox-from-scratch:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'qma') }}/projects/seedbox
    - require:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'qma') }}/projects/seedbox/
