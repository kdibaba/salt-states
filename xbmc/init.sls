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

ssh://git@bitbucket.org:SGTJohnny/xbmc_userdata.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/dotfiles
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa

unzip_tar:
  module.run:
    - name: archive.gunzip
    - gzipfile: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/XBMC_userdata/userdata.tar.gz
    - require:
      - git: https://bitbucket.org/SGTJohnny/xbmc_userdata

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
