include:
  - iptables
  - iptables.drop

glance rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - glance rule 1:
        - dport: 9292
      - glance rule 2:
        - dport: 9191
