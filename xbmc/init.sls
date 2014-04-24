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

unzip_tar:
  module.run:
    - name: archive.gunzip
    - cwd: /home/johnnyg/
    - gzipfile: /home/johnnyg/userdata.tar.gz

untar_userdata:
  module.run:
    - name: archive.tar
    - options: xvf
    - tarfile: /home/johnnyg/userdata.tar
    - dest: /home/johnnyg/.xbmc/
    - require:
      - module: unzip_tar

remove_tar:
  file.absent:
    - name: /home/johnnyg/userdata.tar
    - require:
      - module: untar_userdata

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
    - require:
      - module: untar_userdata
