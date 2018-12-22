include:
  - core.ssh
  - core.pillar
  - core.salt
  - core.htop
  - core.vim
  - core.byobu
  - core.dotfiles

/etc/default/grub:
  file.replace:
    - pattern: 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"'
    - repl: 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash radeon.audio=1"'

update-grub:
  cmd.wait: 
    - name: update-grub
    - watch:
      - file: /etc/default/grub

create_projects_dir:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 755
