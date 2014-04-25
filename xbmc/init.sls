xbmc:
  pkg.installed:
    - name: xbmc
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: xbmc

create_xbmc_home:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 755

download_userdata:
  file.managed:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/
    - source: https://www.dropbox.com/sh/1jqd5sxtjve2zv1/f6jOF9A0Ab/userdata.tar.gz
    - source_hash: https://www.dropbox.com/s/6l8pjo45rjl2kkw/userdata.tar.gz.md5
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}

unzip_tar:
  module.run:
    - name: archive.gunzip
    - cwd: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/

    - gzipfile: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/userdata.tar.gz

untar_userdata:
  module.run:
    - name: archive.tar
    - options: xvf
    - tarfile: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/userdata.tar
    - dest: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc/
    - require:
      - module: unzip_tar

remove_tar:
  file.absent:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/userdata.tar
    - require:
      - module: untar_userdata

/home/johhnyg/.xbmc/userdata/:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc/userdata/
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - require:
      - module: untar_userdata
