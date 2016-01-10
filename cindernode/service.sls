include:
  - .config

start cinder:
  service.running:
    - names:
      - lvm2-lvmetad.service
      - target.service
      - openstack-cinder-volume.service
    - enable: True
    - listen:
      - file: cinder config file
