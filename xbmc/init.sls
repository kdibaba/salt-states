xbmc:
  pkg.installed:
    - name: xbmc
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: xbmc

create_xbmc_home:
  file.directory:
    - name: /home/johnnyg/.xbmc
    - user: johnnyg
    - group: johnnyg
    - mode: 755
    - if_missing: /home/johnnyg/.xbmc/

get_user_data:
  cmd.script:
    - shell: /bin/bash
    - user: johnnyg
    - source: salt://xbmc/get_user_data.sh

/home/johnnyg/.xbmc/:
  archive.extracted:
    #- source: https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
    #- source_hash: https://www.dropbox.com/s/6l8pjo45rjl2kkw/userdata.tar.gz.md5 
    - name: /home/johnnyg/.xbmc/userdata
    - source_hash: md5=886ad367654c0c615cd238126a80eddb
    - source: salt://xbmc/userdata.tar.gz
    - archive_format: tar
    - if_missing: /home/johnnyg/.xbmc/userdata/
    - tar_options: zxvf 

/home/johhnyg/.xbmc/userdata/:
  file.directory:
    - name: /home/johnnyg/.xbmc/userdata/
    - user: johnnyg
    - group: johnnyg
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
   #- watch:
    #- archive: /home/johnnyg/.xbmc/userdata
