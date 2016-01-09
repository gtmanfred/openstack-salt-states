nova config file:
  file.managed:
    - names:
      - /etc/nova/nova.conf:
        - source: salt://novadocker/files/nova.conf
      - /etc/nova/rootwrap.d/docker.filters:
        - contents: |
            # nova-rootwrap command filters for setting up network in the docker driver
            # This file should be owned by (and only-writeable by) the root user

            [Filters]
            # nova/virt/docker/driver.py: 'ln', '-sf', '/var/run/netns/.*'
            ln: CommandFilter, /bin/ln, root
    - makedirs: True
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
