base:
  'postgres*':
    - postgres
  'rabbitmq*':
    - rabbitmq
  'keystone*':
    - postgres.keystone
    - keystone
  'glance*':
    - postgres.glance
    - keystone.glance
  'nova*':
    - keystone.nova
    - keystone.neutron
    - rabbitmq.nova
  'novaapi*':
    - postgres.nova
  'neutron*':
    - keystone.neutron
    - keystone.nova
    - rabbitmq.neutron
  'neutronapi*':
    - postgres.neutron
