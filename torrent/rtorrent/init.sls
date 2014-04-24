rtorrent:
  pkg.installed:
    - name: rtorrent
  cmd:
    - run
    - name: screen -d -m -S rtorrent rtorrent
    - require:
      - pkg: screen
