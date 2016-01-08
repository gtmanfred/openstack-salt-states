setup sysctl for networks:
  sysctl.present:
    - names:
      {%- if salt['config.get']('neutron:mechanism:ovs')  %}
      - net.ipv4.conf.all.rp_filter:
        - value: 0
      - net.ipv4.conf.default.rp_filter:
        - value: 0
      - net.bridge.bridge-nf-call-iptables:
        - value: 1
      - net.bridge.bridge-nf-call-ip6tables:
        - value: 1
      {%- else %}
      - net.ipv4.ip_forward:
        - value: 1
      - net.ipv4.conf.all.rp_filter:
        - value: 0
      - net.ipv4.conf.default.rp_filter: 
        - value: 0
      {%- endif %}
