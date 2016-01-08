nat routes:
  network.routes:
    - name: eth2
    - routes:
      - name: netroutes
        ipaddr: 172.16.1.128
        netmask: 255.255.255.128
        gateway: 172.16.1.129
