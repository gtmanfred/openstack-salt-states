include:
  - .config

start neutron:
  service.running:
    - names:
      - neutron-server.service
      - neutron-l3-agent.service:
        - listen:
          - file: /etc/neutron/l3_agent.ini
      - neutron-dhcp-agent.service:
        - listen:
          - file: /etc/neutron/dnsmasq-neutron.conf
      - neutron-metadata-agent.service
      {%- if salt['config.get']('neutron:mechanism:ovs')  %}
      - openvswitch.service
      - neutron-openvswitch-agent.service
      {%- else %}
      - neutron-linuxbridge-agent.service:
        - listen:
          - file: /etc/neutron/plugins/ml2/linuxbridge_agent.ini
      {%- endif %}
    - enable: True
    - listen:
      - file: /etc/neutron/neutron.conf
