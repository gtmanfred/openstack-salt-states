include:
  - iptables
  - iptables.drop

horizon rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - horizon rule 1:
        - dport: 80
