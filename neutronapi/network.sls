{%- if '172.16.1.129' not in salt['network.ip_addrs'](cidr='172.16.1.128/25') %}
floating gateway ip:
  cmd.run:
    - name: ip addr add 172.16.1.129/24 dev eth2
{%- endif %}
