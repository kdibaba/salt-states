snes:
  pkg.installed:
    - names:
      - zsnes
      - openbox
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.zsnes
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 755
  #config file ~/.zsnes/zsnesl.cfg

wired_controler:
  pkg.installed:
    - install_recommends: True
    - names:
      - jstest*
      - joystick
      - xboxdrv
