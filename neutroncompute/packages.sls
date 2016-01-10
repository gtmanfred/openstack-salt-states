include:
  - .repos

neutron packages:
  pkg.latest:
    - pkgs:
      - openstack-neutron
      - openstack-neutron-ml2
      - ebtables
      - ipset
      {%- if salt['config.get']('neutron:mechanism:ovs')  %}
      - openstack-neutron-openvswitch
      {%- else %}
      - openstack-neutron-linuxbridge
      {%- endif %}
