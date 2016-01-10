include:
  - .repos

nova packages:
  pkg.latest:
    - pkgs:
      - openstack-nova-compute
      - docker-engine
      - libguestfs-tools
      - sysfsutils
      - python-pip

  git.latest:
    - name: git://github.com/openstack/nova-docker.git
    - target: /srv/novadocker

  pip.installed:
    - name: /srv/novadocker
    - requirements: /srv/novadocker/requirements.txt
    - editable: /srv/novadocker
    - onchanges:
      - git: nova packages
