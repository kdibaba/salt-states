include:
  - core.ssh

openssh-server:
  pkg.installed:
    - name: openssh-server

/etc/ssh/sshd_conf:
  file.managed:
    - source: salt://core/ssh/server/sshd_conf

ssh:
  service:
    - running
    - name: ssh
    watch:
      - file: /etc/ssh/sshd_conf
  require:
    - pkg: openssh-server

