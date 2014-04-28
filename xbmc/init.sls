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
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc/
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa

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
    - require:
      - file: create_xbmc_home

