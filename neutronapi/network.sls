{%- if '172.16.1.129' not in salt['network.ip_addrs'](cidr='172.16.1.128/25') %}
private nat gateway:
  network.managed:
    - name: eth2:1
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.1.129
    - netmask: 255.255.255.128
{%- endif %}
