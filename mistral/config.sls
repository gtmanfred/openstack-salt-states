mistral config file:
  file.managed:
    - names:
      - /etc/mistral.conf:
        - source: salt://mistral/files/mistral.conf
    - user: mistral
    - group: mistral
    - mode: 640
    - template: jinja

mistral file perms:
  file.directory:
    - names:
      - /var/log/mistral
    - user: mistral
    - group: mistral
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
