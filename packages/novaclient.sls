install novaclient:
  pkg.latest:
    - names:
      - python-pip
      - gcc

  pip.installed:
    - names:
      - rackspace-novaclient
      - Jinja2 >= 2.8
    - reload_modules: True

  service.running:
    - name: salt-minion
    - listen:
      - pip: Jinja2 >= 2.8
