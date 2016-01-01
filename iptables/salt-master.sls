include:
  - iptables

salt master rules:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - in-interface: eth2
    - save: True
    - names:
      - master rule 1:
        - dport: 4505
      - master rule 2:
        - dport: 4506
