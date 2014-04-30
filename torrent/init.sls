include:
  - torrent.rtorrent
  - torrent.rsync

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/autodl-setup:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - source: salt://torrent/autodl-setup
