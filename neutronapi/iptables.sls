include:
  - iptables
  - iptables.accept

neutron rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - neutron rule 1:
        - dport: 9696

gateway rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - in-interface: eth2
    - save: True

# iptables -t nat -A POSTROUTING -s 172.16.2.0/24 ! -d 172.16.0.0/22 -j SNAT --to-source 162.242.253.238
postrouting rule:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - source: 172.16.1.128/25
    - destination: '! 172.16.0.0/22'
    - to-source: {{salt['grains.get']('ip4_interfaces:eth0:0')}}
    - jump: SNAT
    - save: True
