include:
  - iptables

postgres rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - in-interface: eth1
    - dport: 5432
    - save: True
