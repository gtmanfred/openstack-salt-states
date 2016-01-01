include:
  - .config

start glance:
  service.running:
    - names: 
      - openstack-glance-api:
        - listen:
          - file: /etc/glance/glance-api.conf
      - openstack-glance-registry:
        - listen:
          - file: /etc/glance/glance-registry.conf
    - enable: True
