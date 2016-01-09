nova user:
  user.present:
    - name: nova
    - shell: /sbin/nologin
    - system: True
    - home: /var/lib/nova
    - uid: 162
    - gid: 162
    - groups:
      - nobody
      - qemu
      - docker
