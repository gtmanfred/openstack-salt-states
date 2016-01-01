{%- set publicip = salt['config.get']('ips:keystone:public') %}
{%- set privateip = salt['config.get']('ips:keystone:private') %}
keystone:
  services:
    - name: keystone
      description: Openstack Identity
      type: identity
  endpoints:
    - name: keystone
      region: RegionOne
      publicurl: http://{{publicip}}:5000/v2.0
      internalurl: http://{{privateip}}:5000/v2.0
      adminurl: http://{{privateip}}:35357/v2.0
  tenants:
    - description: Admin Project
      name: admin
    - description: Demo Project
      name: demo
    - description: Service Project
      name: service
  users:
    admin:
      name: admin
      password: adminpass
      roles:
        admin:
          - admin
        service:
          - admin
    demo:
      name: demo
      password: demopass
      roles:
        demo:
          - user
  roles:
    - admin
    - user
