media:
  raid.present:
    - level: 6
    - devices:
      {% for device in raid['devices'] %}
      - {{ device }}
      {% endfor %}

xfs_mkfs:
  cmd.run:
    - name: mkfs.xfs {{ raid['mount_dev'] }} -L {{ raid['label'] }}
    - unless: 'test "$(blkid {{ raid['mount_dev'] }} -s TYPE -o value)" == xfs"'
    - require:
      - raid: media

{{ raid['mount_point'] }}:
  mount.mounted:
    - device: {{ raid['mount_dev'] }}
    - fstype: xfs
    - mkmnt: True
    - opts:
      {% for opt in raid['mount_opts'] %}
      - {{ opt }}
      {% endfor %}
    - require:
      - raid: media
      - cmd: xfs_mkfs


