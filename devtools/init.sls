vim:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}
{% if grains['os'] == 'Gentoo' %}
  portage_config.flags:
    - name: {{ salt['pillar.get']('pkgs:vim', 'vim') }}
    - use:
      - python
      - vim-pager
    - require_in:
      - pkg: vim
{% endif %}

vcs:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:mercurial', 'mercurial') }}
      - {{ salt['pillar.get']('pkgs:git', 'git') }}

vagrant:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:vagrant', 'vagrant') }}

virtualbox:
  pkg.installed:
    - name: {{ salt['pillar.get']('pkgs:virtualbox', 'virtualbox') }}
    - require_in:
      - pkg: vagrant

python-tools:
  pkg.installed:
    - names:
      - {{ salt['pillar.get']('pkgs:flake8', 'flake8') }}
      - {{ salt['pillar.get']('pkgs:pep8', 'pep8') }}
      - {{ salt['pillar.get']('pkgs:virtualenv', 'virtualenv') }}
      - {{ salt['pillar.get']('pkgs:tox', 'tox') }}
      - {{ salt['pillar.get']('pkgs:pip', 'pip') }}
      - automake
      - libtool

pip_packages:
  pip.installed:
    - names:
      - django
      - pylint
      - ipython
      - jedi
    - require:
      - pkg: python-tools
