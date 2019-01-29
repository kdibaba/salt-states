/var/www/:
  file.directory:
    - user: www-data
    - group: www-data
  archive.extracted:
    - source: salt://seedbox/rutorrent/ruTorrent-3.8.tar.gz
    - user: www-data
    - group: www-data

rutorrent:
  pkg.installed:
    - names:
      - php7.2-fpm
      - php7.2-cli
      - php-geoip
      - nginx
      - apache2-utils

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://seedbox/rutorrent/ru_torrent_nginx.conf
    - user: root

/var/www/ruTorrent-3.8/.htpasswd:
  file.managed:
    - source: salt://seedbox/rutorrent/.htpasswd
    - user: www-data
    - group: www-data
