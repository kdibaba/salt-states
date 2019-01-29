/var/www/:
  file.directory:
    - user: www-data
    - group: www-data

rutorrent:
  pkg.installed:
    - names:
      - php5-fpm
      - php5-cli
      - php5-geoip
      - nginx

rutorrent:
  archive.extracted:
    - name: /var/www/rutorrent-3.8
    - source: salt://seedbox/rutorrent/ruTorrent-3.8.tar.gz
    - user: www-data
    - group: www-data
