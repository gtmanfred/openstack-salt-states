base:
  '*':
    - defaults
    - hosts
    - repos
    #- packages.updated
  'salt*':
    - iptables.salt-master
  'postgres*':
    - postgres
  'memcached*':
    - memcached
  'rabbitmq*':
    - rabbitmq
  'keystone*':
    - keystone
  'glance*':
    - glance
  'novaapi*':
    - novaapi
  'novacompute*':
    - novacompute
    - neutroncompute
  'neutronapi*':
    - neutronapi
  'mistral*':
    - mistral
