include:
  - iptables
  - iptables.drop

cinder rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - cinder rule 1:
        - dport: 8776
