include:
  - .config

start neutron:
  service.running:
    - names:
      - neutron-server.service
      - neutron-linuxbridge-agent.service:
        - listen:
          - file: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
      - neutron-dhcp-agent.service
      - neutron-metadata-agent.service
    - enable: True
    - listen:
      - file: /etc/neutron/neutron.conf
