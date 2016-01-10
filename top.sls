base:
  '*':
    - defaults
    - hosts
    - repos
    #- packages.updated
  'salt*':
    - networks.natroutes
    - iptables.salt-master
    - repos.docker
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
  'novadocker*':
    - novadocker
    - neutroncompute
  'neutronapi*':
    - neutronapi
  'mistral*':
    - mistral
  'horizon*':
    - horizon
