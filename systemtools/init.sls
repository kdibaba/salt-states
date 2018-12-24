systemtools:
  pkg.installed:
    - names:
      - byobu
      - rsync
      - openssh-server
      - {{ salt['pillar.get']('pkgs:htop', 'htop') }}
      - {{ salt['pillar.get']('pkgs:aide', 'aide') }}
      - {{ salt['pillar.get']('pkgs:screen', 'screen') }}
      - {{ salt['pillar.get']('pkgs:tmux', 'tmux') }}
      - {{ salt['pillar.get']('pkgs:dos2unix', 'dos2unix') }}
      - {{ salt['pillar.get']('pkgs:tree', 'tree') }}
      - {{ salt['pillar.get']('pkgs:strace', 'strace') }}
      - {{ salt['pillar.get']('pkgs:iftop', 'iftop') }}
      - {{ salt['pillar.get']('pkgs:netcat', 'netcat') }}
      - {{ salt['pillar.get']('pkgs:nmap', 'nmap') }}
      - {{ salt['pillar.get']('pkgs:tcpdump', 'tcpdump') }}
      - {{ salt['pillar.get']('pkgs:bwm-ng', 'bwm-ng') }}
      - {{ salt['pillar.get']('pkgs:iptables', 'iptables') }}
      - {{ salt['pillar.get']('pkgs:bridge-utils', 'bridge-utils') }}
      - {{ salt['pillar.get']('pkgs:stunnel', 'stunnel') }}
      - {{ salt['pillar.get']('pkgs:lshw', 'lshw') }}
      - {{ salt['pillar.get']('pkgs:pciutils', 'pciutils') }}
      - {{ salt['pillar.get']('pkgs:usbutils', 'usbutils') }}
      - {{ salt['pillar.get']('pkgs:usermode-utilities', 'usermode-utilities') }}
      - {{ salt['pillar.get']('pkgs:bc', 'bc') }}
      - {{ salt['pillar.get']('pkgs:dfc', 'dfc') }}
      - {{ salt['pillar.get']('pkgs:lsscsi', 'lsscsi') }}
      - {{ salt['pillar.get']('pkgs:iotop', 'iotop') }}
      - {{ salt['pillar.get']('pkgs:lsof', 'lsof') }}
      - {{ salt['pillar.get']('pkgs:ack', 'ack-grep') }}
      - {{ salt['pillar.get']('pkgs:dmidecode', 'dmidecode') }}
      #- {{ salt['pillar.get']('pkgs:hwinfo', 'hwinfo') }}

fstools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:dosfstools', 'dosfstools') }}
      - {{ salt['pillar.get']('pkgs:ntfs3g', 'ntfs-3g') }}
      - {{ salt['pillar.get']('pkgs:sysfsutils', 'sysfsutils') }}
      - {{ salt['pillar.get']('pkgs:xfsprogs', 'xfsprogs') }}
      #- {{ salt['pillar.get']('pkgs:mtpfs', 'mtpfs') }}

sshguard:
  pkg.installed:
    - name: sshguard
  service.running:
    - enable: True
    - require:
      - pkg: sshguard

/etc/ssh/sshd_conf:
  file.managed:
    - source: salt://systemtools/sshd_config

ssh:
  service:
    - running
    - name: ssh
  watch:
    - file: /etc/ssh/sshd_conf
  require:
    - pkg: openssh-server

