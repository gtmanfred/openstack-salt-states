psql path:
  file.managed:
    - name: /etc/profile.d/psql.sh
    - contents: |
        export PATH="/usr/pgsql-9.4/bin/:$PATH"
