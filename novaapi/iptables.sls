include:
  - iptables

nova rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - nova rule 1:
        - dport: 8774
      - nova rule 2:
        - dport: 8775
      - nova rule 3:
        - dport: 6080
