keystone config file:
  file.managed:
    - name: /etc/keystone/keystone.conf
    - source: salt://keystone/files/keystone.conf
    - user: keystone
    - group: keystone
    - mode: 640
    - template: jinja

keystone-paste file:
  file.managed:
    - name: /etc/keystone/keystone-paste.ini
    - source: salt://keystone/files/keystone-paste.ini
    - user: keystone
    - group: keystone
    - mode: 640

keystone ssl file:
  cmd.run:
    - name: keystone-manage pki_setup --keystone-user keystone --keystone-group keystone
    - unless: test -d /etc/keystone/ssl/certs/

  file.directory:
    - names:
      - /etc/keystone/ssl/
      - /var/log/keystone/
    - user: keystone
    - group: keystone
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
