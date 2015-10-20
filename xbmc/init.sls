kodi:
  pkg.installed:
    - name: kodi
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: kodi 

create_xbmc_home:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.kodi
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 755
  git.latest:
    - name: git@bitbucket.org:SGTJohnny/xbmc.userdata.git
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc/
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa
    - watch:
      - file: create_xbmc_home
