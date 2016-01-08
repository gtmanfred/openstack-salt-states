default to drop:
  iptables.set_policy:
    - chain: INPUT
    - policy: DROP
