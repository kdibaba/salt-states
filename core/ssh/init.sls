openssh:
  pkg.installed:
    - name: openssh-server

    
sshguard:
  pkg.installed:
    - name: sshguard
  service.running:
    - enable: True
    - require:
      - pkg: sshguard
