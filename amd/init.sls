amd_drivers:
  pkg.installed:
    - names:
      - fglrx
      - fglrx-amdcccle
  cmd.wait:
    - user: root
    - name: aticonfig --initial
