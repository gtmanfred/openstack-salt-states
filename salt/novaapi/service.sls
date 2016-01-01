include:
  - .config

start nova:
  service.running:
    - names:
      - openstack-nova-api.service
      - openstack-nova-cert.service
      - openstack-nova-consoleauth.service
      - openstack-nova-scheduler.service
      - openstack-nova-conductor.service
      - openstack-nova-novncproxy.service
    - enable: True
    - listen:
      - file: /etc/nova/nova.conf
