cloud setup:
  salt.function:
    - name: saltutil.runner
    - tgt: 'salt*'
    - kwargs:
        path: /etc/salt/cloud.maps.d/openstack.sls
        parallel: True
