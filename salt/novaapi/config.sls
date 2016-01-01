nova config file:
  file.managed:
    - name: /etc/nova/nova.conf
    - source: salt://novaapi/files/nova.conf
    - user: nova
    - group: nova
    - mode: 640
    - template: jinja

nova file perms:
  file.directory:
    - names:
      - /etc/nova
      - /var/log/nova
    - user: nova
    - group: nova
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
