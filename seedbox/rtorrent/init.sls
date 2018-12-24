rtorrent:
  pkg.installed:
    - name: rtorrent
  cmd.run:
    - name: screen -d -m -S rtorrent rtorrent
    - user: johnnyg
    - unless: test $(screen -list | grep 'rtorrent' -c) -gt 0
    - require:
      - pkg: screen
