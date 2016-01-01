base:
  '*':
    - ips
  'keystone*':
    - keystone.token
  'glance*':
    - keystone.token
  'nova*':
    - keystone.token
  'neutron*':
    - keystone.token
