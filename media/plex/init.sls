plexmediaserver:
  pkg.installed:
    - sources:
      - plexmediaserver: https://downloads.plex.tv/plex-media-server/0.9.12.13.1464-4ccd2ca/plexmediaserver_0.9.12.13.1464-4ccd2ca_amd64.deb
  service.running:
    - enable: True

{% if salt['pillar.get']('plex:tmp_dir', False) %}
{{ salt['pillar.get']('plex:tmp_dir') }}:
  file.directory:
    - user: plex
    - group: plex
    - mode: 755 
    - makedirs: True
    - require:
      - pkg: plexmediaserver
    - watch_in:
      - service: plexmediaserver
{% endif %}

{% if salt['pillar.get']('plex:app_dir', False) %}
{{ salt['pillar.get']('plex:app_dir') }}:
  file.directory:
    - user: plex
    - group: plex
    - mode: 755 
    - makedirs: True
    - require:
      - pkg: plexmediaserver
    - watch_in:
      - service: plexmediaserver
{% endif %}

/etc/default/plexmediaserver:
  file.managed:
    - source: salt://media/plex/plex.default
    - template: jinja
    - require:
      - pkg: plexmediaserver
    - watch_in:
      - service: plexmediaserver
