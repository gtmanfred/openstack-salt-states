include:
  - iptables
  - iptables.drop

cinder node rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - in-interface: eth1
    - save: True
    - names:
      - cinder rule 1:
        - dport: 3260
