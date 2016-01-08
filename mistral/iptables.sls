include:
  - iptables
  - iptables.drop

mistral rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - mistral rule 1:
        - dport: 8989
