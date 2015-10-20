'/dev/md/J5-HOTS:0':
  raid.present:
    - level: 6
    - devices:
      {% for device in salt['pillar.get']('storage:raid:devices', '')%}
      - {{ device }}
      {% endfor %}


xfs_mkfs:
  cmd.run:
    - name: mkfs.xfs {{ raid['mount_dev'] }} -L {{ raid['label'] }}
    - unless: 'test "$(blkid {{ raid['mount_dev'] }} -s TYPE -o value)" == "xfs"'
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

# packages used for making sure server can email me when raid is in trouble
#https://rtcamp.com/tutorials/linux/ubuntu-postfix-gmail-smtp/
smtp_ubuntu:
  pkg.installed:
    - names:
      - postfix
      - mailutils
      - libsasl2-2
      - ca-certificates
      - libsasl2-modules

/etc/postfix/main.cf:
  file.managed:
  - source: salt://media/storage/main.cf
  - require:
    - pkg: postfix
