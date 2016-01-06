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

  pip.latest:
    - name: psycopg2

mistral install:
  user.present:
    - name: mistral
    - shell: /bin/false
    - system: True
    - home: /srv/mistral

  git.latest:
    - name: git://github.com/openstack/mistral.git
    - target: /srv/mistral

  pip.installed:
    - name: mistral
    - requirements: /srv/mistral/requirements.txt
    - editable: /srv/mistral
