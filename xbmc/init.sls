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

git@bitbucket.org:SGTJohnny/xbmc_userdata.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/xbmc_userdata
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa

unzip_tar:
  module.run:
    - name: archive.gunzip
    - gzipfile: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/xbmc_userdata/userdata.tar.gz
    - require:
      - file: user_data_exists

untar_userdata:
  module.run:
    - name: archive.tar
    - options: xvf
    - tarfile: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/xbmc_userdata/userdata.tar
    - dest: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc/
    - watch:
      - module: unzip_tar

manage_userdata_permissions:
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
    - watch:
      - module: untar_userdata

user_data_exists:
  file.exists:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/xbmc_userdata/userdata.tar.gz
