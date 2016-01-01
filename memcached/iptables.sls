include:
  - iptables

memcached rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - in-interface: eth1
    - dport: 11211
    - save: True
