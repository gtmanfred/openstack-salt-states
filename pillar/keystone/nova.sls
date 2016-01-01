{%- set publicip = salt['config.get']('ips:novaapi:public') %}
{%- set privateip = salt['config.get']('ips:novaapi:private') %}

include:
  - keystone.keystone

keystone:
  services:
    - name: nova
      description: OpenStack Compute
      type: compute
  endpoints:
    - name: nova
      region: RegionOne
      publicurl: 'http://{{publicip}}:8774/v2/%(tenant_id)s'
      internalurl: 'http://{{privateip}}:8774/v2/%(tenant_id)s'
      adminurl: 'http://{{privateip}}:8774/v2/%(tenant_id)s'
  users:
    nova:
      name: nova
      password: hm1eixi5am2IZ2
      roles:
        service:
          - admin
