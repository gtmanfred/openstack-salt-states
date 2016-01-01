postgresql config:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/postgresql.conf
    - changes:
      - set listen_addresses 0.0.0.0

pg_hba config localhost:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/pg_hba.conf
    - changes:
      - set 1/type local
      - set 1/database all
      - set 1/user all
      - set 1/method peer

pg_hba config 127.0.0.1/32:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/pg_hba.conf
    - changes:
      - set 2/type host
      - set 2/database all
      - set 2/user all
      - set 2/address 127.0.0.1/32
      - set 2/method ident

pg_hba config locahost6:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/pg_hba.conf
    - changes:
      - set 3/type host
      - set 3/database all
      - set 3/user all
      - set 3/address ::1/128
      - set 3/method ident

pg_hba config 10.176.0.0/12:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/pg_hba.conf
    - changes:
      - set 4/type host
      - set 4/database all
      - set 4/user all
      - set 4/address 10.176.0.0/12
      - set 4/method md5

pg_hba config 10.208.0.0/12:
  augeas.change:
    - context: /files/var/lib/pgsql/9.4/data/pg_hba.conf
    - changes:
      - set 5/type host
      - set 5/database all
      - set 5/user all
      - set 5/address 10.208.0.0/12
      - set 5/method md5
