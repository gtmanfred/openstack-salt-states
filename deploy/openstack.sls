cloud setup:
  salt.function:
    - name: saltutil.runner
    - tgt: 'salt*'
    - arg:
      - cloud.map_run
    - kwarg:
        path: /etc/salt/cloud.maps.d/openstack.map
        parallel: True

check networking:
  salt.function:
    - name: network.ping
    - tgt: '*'
    - kwarg:
        return_boolean: True
        host: {{salt.saltutil.runner('mine.get', tgt='salt*', fun='neutron_ips').values()[0][0]}}
    - prereq:
      - salt: database setup
      - salt: keystone setup
      - salt: everything else setup

update mine:
  salt.function:
    - tgt: '*'
    - names:
      - saltutil.pillar_refresh
      - mine.update
    - prereq:
      - salt: database setup
      - salt: keystone setup
      - salt: everything else setup

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
    - tgt: 'glance* or nova* or neutron* or mistral* or horizon* or cinder* or salt*'
    - tgt_type: compound
    - highstate: True
