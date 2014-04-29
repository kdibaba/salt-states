movie_cron:
  cron.present:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - minute: 0 #do this hourly
    - name: rsync -a --ignore-existing {{salt['pillar.get']('locations:johnny:seedbox:movies', 'Fail')}} {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}@{{salt['pillar.get']('htpc:johnny:host', '192.168.1.1')}}:{{salt['pillar.get']('locations:johnny:htpc:movies', '/home/johnnyg/movies/')}}
