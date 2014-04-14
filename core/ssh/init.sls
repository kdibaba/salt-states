openssh-client:
  pkg.installed:
    - name: openssh-client

    
sshguard:
  pkg.installed:
    - name: sshguard
  service.running:
    - enable: True
    - require:
      - pkg: sshguard

/etc/ssh/ssh_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    #- source: salt://ssh/ssh_config
    - require:
        - pkg: openssh-client
