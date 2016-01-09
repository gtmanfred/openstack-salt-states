include:
  - .config

start nova:
  service.running:
    - names:
      - docker
      - openstack-nova-compute.service:
        - listen:
          - file: /etc/nova/nova.conf
    - enable: True
