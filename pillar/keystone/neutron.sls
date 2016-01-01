{%- set publicip = salt['config.get']('ips:neutronapi:public') %}
{%- set privateip = salt['config.get']('ips:neutronapi:private') %}

include:
  - keystone.keystone

keystone:
  services:
    - name: neutron
      description: OpenStack Networking
      type: network
  endpoints:
    - name: neutron
      region: RegionOne
      publicurl: 'http://{{privateip}}:9696'
      internalurl: 'http://{{privateip}}:9696'
      adminurl: 'http://{{privateip}}:9696'
  users:
    neutron:
      name: neutron
      password: uBu7bahxiMoo6qu
      roles:
        service:
          - admin
