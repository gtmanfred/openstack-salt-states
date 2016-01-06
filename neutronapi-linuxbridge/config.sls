neutron config file:
  file.managed:
    - names:
      - /etc/neutron/neutron.conf:
        - source: salt://neutronapi-linuxbridge/files/neutron.conf
      - /etc/neutron/plugins/ml2/ml2_conf.ini:
        - source: salt://neutronapi-linuxbridge/files/ml2_conf.ini
      - /etc/neutron/dhcp_agent.ini:
        - source: salt://neutronapi-linuxbridge/files/dhcp_agent.ini
      - /etc/neutron/plugins/ml2/linuxbridge_agent.ini:
        - source: salt://neutronapi-linuxbridge/files/linuxbridge_agent.ini
      - /etc/neutron/metadata_agent.ini:
        - source: salt://neutronapi-linuxbridge/files/metadata_agent.ini
      - /etc/neutron/l3_agent.ini:
        - source: salt://neutronapi-linuxbridge/files/l3_agent.ini
      - /etc/neutron/dnsmasq-neutron.conf:
        - source: salt://neutronapi-linuxbridge/files/dnsmasq-neutron.conf
    - user: neutron
    - group: neutron
    - mode: 640
    - template: jinja

neutron plugin symlink:
  file.symlink:
    - name: /etc/neutron/plugin.ini
    - target: /etc/neutron/plugins/ml2/ml2_conf.ini
    - user: neutron
    - group: neutron
    - mode: 640

neutron file perms:
  file.directory:
    - names:
      - /etc/neutron
      - /var/log/neutron
    - user: neutron
    - group: neutron
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
