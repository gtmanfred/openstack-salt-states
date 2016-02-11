cloud setup:
  salt.function:
    - name: saltutil.runner
    - tgt: 'salt*'
    - kwargs:
        path: /etc/salt/cloud.maps.d/openstack.sls
        parallel: True

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
    - tgt: 'glance* or nova* or neutron* or mistral* or horizon* or cinder*'
    - tgt_type: compound
    - highstate: True
