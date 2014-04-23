xbmc:
  pkg.installed:
    - name: xbmc
  pkgrepo.managed:
    - ppa: team-xbmc/ppa
    - require_in:
      - pkg: xbmc

xbmc_get_user_data:
  cmd.script:
    - shell: /bin/bash
    - user: johnnyg
    - source: salt://xbmc/get_user_data.sh
