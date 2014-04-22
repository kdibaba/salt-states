vsftpd:
  pkg.installed:
    - name: vsftpd
  service:
    - running
    - watch:
      - pkg: vsftpd
      - file: /etc/vsftpd.conf

/etc/vsftpd.conf:
  file.managed:
    - source: salt://media/ftp/vsftpd.conf
    - user: root
    - group: root
    - mode: 644
