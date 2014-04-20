gnome:
  pkg.installed:
    - pkgs:
      - gnome-shell
      - ubuntu-gnome-desktop
  pkgrepo.managed:
    - ppa: gnome3-team/gnome3
    - require_in:
      - pkg: gnome


