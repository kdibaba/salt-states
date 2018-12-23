ssh://git@github.com/johnnygaffey/dotfiles.git:
  git.latest:
    - rev: master
    - target: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/dotfiles
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - identity: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa
    - require_in:
      cmd: install_dotfiles

# TODO: does install permission need to be set so anyone can run it?
install_dotfiles:
  cmd.run:
    - name: install.sh
    - cwd: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/projects/dotfiles
