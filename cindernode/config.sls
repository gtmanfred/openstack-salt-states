include:
  - .packages

cinder config file:
  file.managed:
    - name: /etc/cinder/cinder.conf
    - source: salt://cindernode/files/cinder.conf
    - user: cinder
    - group: cinder
    - mode: 640
    - template: jinja

cinder file perms:
  file.directory:
    - names:
      - /etc/cinder
      - /var/log/cinder
    - user: cinder
    - group: cinder
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
