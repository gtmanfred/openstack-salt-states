include:
  - .config

start neutron:
  service.running:
    - enable: True
    - listen:
      - file: neutron compute config file
    {%- if salt['config.get']('neutron:mechanism')  %}
    - names:
      - openvswitch.service
      - neutron-openvswitch-agent.service
    {%- else %}
    - name: neutron-linuxbridge-agent.service
    {%- endif %}
