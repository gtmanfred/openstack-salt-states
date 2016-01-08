neutron compute config file:
  file.managed:
    - names:
      - /etc/neutron/neutron.conf:
        - source: salt://neutroncompute/files/neutron.conf
      - /etc/neutron/plugins/ml2/ml2_conf.ini:
        - source: salt://neutroncompute/files/ml2_conf.ini
      {%- if not salt['config.get']('neutron:mechanism:ovs') %}
      - /etc/neutron/plugins/ml2/linuxbridge_agent.ini:
        - source: salt://neutroncompute/files/linuxbridge_agent.ini
      {%- endif %}
    - user: neutron
    - group: neutron
    - mode: 640
    - template: jinja

neutron compute plugin symlink:
  file.symlink:
    - name: /etc/neutron/plugin.ini
    - target: /etc/neutron/plugins/ml2/ml2_conf.ini
    - user: neutron
    - group: neutron
    - mode: 640

neutron compute file perms:
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
