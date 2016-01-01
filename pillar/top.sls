base:
  '*':
    - ips
  'keystone*':
    - keystone.token
  'glance*':
    - keystone.token
    - keystone.glance
  'nova*':
    - keystone.token
    - keystone.nova
    - keystone.neutron
  'neutron*':
    - keystone.token
    - keystone.neutron
    - keystone.nova
