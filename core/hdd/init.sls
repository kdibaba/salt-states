/mnt/TV-Shows:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  mount.mounted:
    - device: UUID={{ salt['pillar.get']('hdd:tv_shows:uid', '1') }} 
    - fstype: ntfs-3g
    - opts:
      - uid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
      - gid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - persist: True

/mnt/Movies_one:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  mount.mounted:
    - device: UUID={{ salt['pillar.get']('hdd:movies_one:uid', '1') }} 
    - fstype: ntfs-3g
    - opts:
      - uid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
      - gid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - persist: True

/mnt/Movies_two:
  file.directory:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
  mount.mounted:
    - device: UUID={{ salt['pillar.get']('hdd:movies_two:uid', '1') }} 
    - fstype: ntfs-3g
    - opts:
      - uid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
      - gid={{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - persist: True

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



