include:
  - .config

start cinder:
  service.running:
    - names:
      - openstack-cinder-api.service
      - openstack-cinder-scheduler.service
    - enable: True
    - listen:
      - file: cinder config file
