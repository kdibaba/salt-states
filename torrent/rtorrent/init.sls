rtorrent:
  pkg.installed:
    - name: rtorrent
  service:
    - running
    - watch:
      - file: ~/.rtorrent.rc
