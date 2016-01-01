{%- set networks = salt['publish.publish']('*.manfred.io', 'network.ip_addrs', arg=['cidr=172.16.0.0/24']) %}
{%- for host, ips in networks.iteritems() %}
{{host}}_eth2:
  host.present:
    - name: {{host}}
    - ip: {{ips[0]}}
{%- endfor %}
