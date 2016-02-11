{%- set networks = salt['mine.get']('*.manfred.io', 'openstack_ips') %}
{%- for host, ips in networks.iteritems() %}
{{host}}_eth1:
  host.present:
    - name: {{host}}
    - ip: {{ips[0]}}
{%- endfor %}
