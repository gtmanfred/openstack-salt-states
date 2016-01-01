{%- set networks = salt['publish.publish']('*.manfred.io', 'network.ip_addrs', arg=['cidr=10.0.0.0/8']) %}
{%- for host, ips in networks.iteritems() %}
{{host}}_eth1:
  host.present:
    - name: {{host}}
    - ip: {{ips[0]}}
{%- endfor %}
