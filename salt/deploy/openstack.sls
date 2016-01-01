database setup:
  salt.state:
    - tgt: 'postgres* or memcached* or rabbitmq*'
    - tgt_type: compound
    - highstate: True

keystone setup:
  salt.state:
    - tgt: 'keystone*'
    - highstate: True

everything else setup:
  salt.state:
    - tgt: 'glance* or nova* or neutron*'
    - tgt_type: compound
    - highstate: True
