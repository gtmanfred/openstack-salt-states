{%- set networks = salt['mine.get']('*.manfred.io', 'api_ips') %}
{%- for host, ips in networks.iteritems() %}
{{host}}_eth1:
  host.present:
    - name: {{host}}
    - ip: {{ips[0]}}
{%- endfor %}
