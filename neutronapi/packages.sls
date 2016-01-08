neutron packages:
  pkg.latest:
    - pkgs:
      - python-psycopg2
      - openstack-neutron
      - openstack-neutron-ml2
      - python-neutronclient
      - ebtables
      - ipset
      {%- if salt['config.get']('neutron:mechanism:ovs')  %}
      - openstack-neutron-openvswitch
      {%- else %}
      - openstack-neutron-linuxbridge
      {%- endif %}

  # patch neutron ip_lib for new iproute
  # https://bugs.launchpad.net/ubuntu/+source/neutron/+bug/1497309
  file.managed:
    - name: /usr/lib/python2.7/site-packages/neutron/agent/linux/ip_lib.py
    - source: salt://neutronapi/files/ip_lib.py
