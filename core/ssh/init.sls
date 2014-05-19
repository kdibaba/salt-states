openssh:
  pkg.installed:
    - name: openssh-server
    
sshguard:
  pkg.installed:
    - name: sshguard
  service.running:
    - enable: True
    - require:
      - pkg: sshguard

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh:
  file.directory:
    - name: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.xbmc
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}
    - mode: 700

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - create: True
    - contents_pillar: 'users:johnny:ssh:hots:private'
    - mode: 400
    - makedirs: True
    - require_in:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa.pub:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - create: True
    - mode: 644
    - contents_pillar: 'users:johnny:ssh:hots:public'
    - makedirs: True
    - require_in:
      - file: /home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh
