include:
  - .config

start neutron:
  service.running:
    - name: neutron-linuxbridge-agent.service
    - enable: True
    - listen:
      - file: /etc/neutron/neutron.conf
      - file: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
