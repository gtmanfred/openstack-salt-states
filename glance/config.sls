glance config file:
  file.managed:
    - names:
      - /etc/glance/glance-api.conf:
        - source: salt://glance/files/glance-api.conf
      - /etc/glance/glance-registry.conf:
        - source: salt://glance/files/glance-registry.conf
    - user: glance
    - group: glance
    - mode: 640
    - template: jinja

glance file perms:
  file.directory:
    - names:
      - /etc/glance
      - /var/log/glance
    - user: glance
    - group: glance
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
