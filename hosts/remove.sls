# remove old host file on all changes incase this is a rebuild

remove old hosts file:
  file.absent:
    - name: /etc/hosts
    - prereq:
      - sls: hosts.records
