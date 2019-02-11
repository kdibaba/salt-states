samba:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:samba', 'samba') }}

/etc/samba/smb.conf:
  file.managed:
    - source: salt://samba/smb.conf
    - require:
      - pkg: samba

smbd:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/samba/smb.conf
    - require:
      - pkg: samba

