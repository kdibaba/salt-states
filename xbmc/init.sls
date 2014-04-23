xbmc:
  pkg.installed:
    - name: xbmc
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: xbmc

/home/johnnyg/.xbmc:
  file.directory:
    - user: johnnyg
    - group: johnnyg
    - mode: 755
  archive.extracted:
    - source: https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
    - source_hash: https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz/+md5
    - archive_format: tar
    - if_missing: /home/johnnyg/.xbmc/userdata

/home/johhnyg/.xbmc/userdata:
  file.directroy:
    - user: johhnyg
    - group: johhnyg
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - watch:
      - archive: /home/johnnyg/.xbmc
