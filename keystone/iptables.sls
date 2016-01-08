include:
  - iptables
  - iptables.drop

keystone rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - keystone rule 1:
        - dport: 5000
      - keystone rule 2:
        - dport: 35357
