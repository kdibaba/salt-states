other-lirc:
  pkg.installed:
    - names: 
      - lirc-x
      - inputlirc
      - liblircclient0
lirc:
  pkg.installed:
    - name: lirc
  service:
    - running
    - watch:
      - file: /etc/lirc/lircd.conf

/etc/lirc/lircd.conf:
  file.managed:
    - source: salt://remote_control/lircd.conf
    - user: root
    - group: root
    - mode: 644

/etc/lirc/hardware.conf:
  file.managed:
    - source: salt://remote_control/hardware.conf
    - user: root
    - group: root
    - mode: 644

