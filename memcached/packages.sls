install memcached:
  pkg.latest:
    - name: memcached

  service.running:
    - name: memcached
    - enable: True
