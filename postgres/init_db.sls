{%- if grains.get('postgres', {}).get('init_db', False) == False %}
init postgres db:
  cmd.run:
    - name: /usr/pgsql-9.4/bin/postgresql94-setup initdb

  grains.present:
    - name: postgres
    - value:
        init_db: True
{%- endif %}
