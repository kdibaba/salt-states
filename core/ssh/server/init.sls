include:
  - core.ssh

openssh-server:
  pkg.installed:
    - name: openssh-server

ssh:
  service:
    - running
    - name: ssh
  require:
    - pkg: openssh-server
