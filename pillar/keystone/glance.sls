{%- set publicip = salt['config.get']('ips:glance:public') %}
{%- set privateip = salt['config.get']('ips:glance:private') %}

include:
  - keystone.keystone

keystone:
  services:
    - name: glance
      description: OpenStack Image service
      type: image
  endpoints:
    - name: glance
      region: RegionOne
      publicurl: http://{{publicip}}:9292/
      internalurl: http://{{privateip}}:9292/
      adminurl: http://{{privateip}}:9292/
  users:
    glance:
      name: glance
      password: EevohghoT2yooX6
      roles:
        service:
          - admin
