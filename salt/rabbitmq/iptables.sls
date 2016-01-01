include:
  - iptables

rabbitmq rule:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - names:
      - rabbitmq rule 1:
        - dport: 5672
