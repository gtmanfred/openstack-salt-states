include:
  - iptables
  - iptables.drop

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
