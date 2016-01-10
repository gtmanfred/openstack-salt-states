include:
  - .repos

cinder packages:
  pkg.latest:
    - pkgs:
      - python-psycopg2
      - lvm2
      - openstack-cinder
      - targetcli
      - python-oslo-policy
