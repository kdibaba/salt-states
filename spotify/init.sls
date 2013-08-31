spotify:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:spotify', 'spotify') }}
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - keyserver: keyserver.ubuntu.com
    - keyid: 94558F59
    - require_in:
      - pkg: spotify
  {% elif grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:spotify', 'spotify') }}
    - accept_keywords:
      - ~ARCH
      - '**'
    - require_in:
      - pkg: spotify
  {% endif %}
