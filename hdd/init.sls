/mnt/Anime:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  mount.mounted:
    - device: UUID={{ salt['pillar.get']('hdd:anime:uid', '1') }} 
    - fstype: ntfs-3g
    - opts:
      - uid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
      - gid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - persist: True

/mnt/Misc:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  mount.mounted:
    - device: UUID={{ salt['pillar.get']('hdd:misc:uid', '1') }} 
    - fstype: ntfs-3g
    - opts:
      - uid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
      - gid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - persist: True

/mnt/TV-Shows:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
  mount.mounted:
    - mkmnt: True
    - device: UUID={{ salt['pillar.get']('hdd:tv_shows:uid', '1') }} 
    - fstype: xfs
    - persist: True
    - opts:
      - noatime
      - nodiratime

/mnt/Movies:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
  mount.mounted:
    - mkmnt: True
    - device: UUID={{ salt['pillar.get']('hdd:movies:uid', '1') }}
    - fstype: xfs
    - persist: True
    - opts:
      - noatime
      - nodiratime

/mnt/temp:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
  mount.mounted:
    - mkmnt: True
    - device: UUID={{ salt['pillar.get']('hdd:temp:uid', '1') }}
    - fstype: xfs
    - persist: True
    - opts:
      - noatime
      - nodiratime

/mnt/Anime-TV:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
  mount.mounted:
    - mkmnt: True
    - device: UUID={{ salt['pillar.get']('hdd:anime_tv:uid', '1') }}
    - fstype: xfs
    - persist: True
    - opts:
      - noatime
      - nodiratime

/mnt/Anime-Movies:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
  mount.mounted:
    - mkmnt: True
    - device: UUID={{ salt['pillar.get']('hdd:anime_movies:uid', '1') }}
    - fstype: xfs
    - persist: True
    - opts:
      - noatime
      - nodiratime
