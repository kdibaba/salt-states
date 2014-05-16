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

/home/{{ salt['pillar.get']('users:johnny:username', 'johnnyg') }}/.ssh/id_rsa.pub:
  file.managed:
    - user: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - group: {{ salt['pillar.get']('users:johnny:username', 'johnnyg') }} 
    - create: True
    - contents_pillar: users:johnny:ssh:hots
    - mode: 700
