mistral config file:
  file.managed:
    - names:
      - /etc/mistral/mistral.conf:
        - source: salt://mistral/files/mistral.conf
    - user: glance
    - group: glance
    - mode: 640
    - template: jinja

mistral file perms:
  file.directory:
    - names:
      - /etc/mistral
      - /var/log/mistral
    - user: mistral
    - group: mistral
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
