include:
  - .config

start nova:
  service.running:
    - names:
      - libvirtd.service:
        - listen:
          - file: /etc/nova/nova.conf
      - openstack-nova-compute.service:
        - listen:
          - file: /etc/nova/nova.conf
    - enable: True
