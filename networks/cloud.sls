include:
  - packages.novaclient

{%- set desired = salt['pillar.get']('networks', ['openstack', 'neutron']) %}
{%- set cur_networks = salt['cloud.virtual_interface_list'](provider='iad', names=[grains.fqdn])[grains.fqdn] %}
{%- for net in desired %}
{% if not cur_networks|map(attribute='ip_addresses')|map('selectattr', 'network_label', 'equalto', net)|map('list')|select|list %}
attach interface {{net}}:
  module.run:
    - name: cloud.virtual_interface_create
    - m_names:
      - {{grains.fqdn}}
    - provider: iad
    - kwargs:
        net_name: {{net}}
{%- endif %}
{%- endfor %}
