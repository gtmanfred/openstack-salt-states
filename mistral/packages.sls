mistral packages:
  pkg.latest:
    - pkgs:
      - python-devel
      - python-pip
      - libffi-devel
      - libxslt-devel
      - libxml2-devel
      - libyaml-devel
      - openssl-devel
      - gcc
      - git
      - postgresql94-devel

  pip.installed:
    - name: psycopg2
    - env_vars:
        PATH: /usr/pgsql-9.4/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

mistral install:
  user.present:
    - name: mistral
    - shell: /bin/false
    - system: True
    - home: /srv/mistral

  git.latest:
    - name: git://github.com/openstack/mistral.git
    - target: /srv/mistral/git

  pip.installed:
    - name: /srv/mistral/git
    - requirements: /srv/mistral/git/requirements.txt
    - editable: /srv/mistral/git
    - unless: pip show mistral
