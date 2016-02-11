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
