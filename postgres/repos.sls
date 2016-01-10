include:
  - .repos

postgres repo:
  pkgrepo.managed:
    - name: pgdg94
    - humanname: PostgreSQL 9.4 $releasever - $basearch
    - gpgcheck: 1
    - baseurl: https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-$releasever-$basearch
    - gpgkey: http://download.postgresql.org/pub/repos/yum/RPM-GPG-KEY-PGDG-94
